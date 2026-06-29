import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Widgets

Scope {
    id: root
    property var theme: DefaultTheme {}
    property string font: "JetBrainsMono NF"

    IpcHandler {
        target: "clipboard"
        function toggle() {
            clipboardPanel.visible = !clipboardPanel.visible;
            if (clipboardPanel.visible) {
                searchInput.text = "";
                selectedIndex = 0;
                refreshHistory();
                searchInput.forceActiveFocus();
            }
        }
    }

    property int selectedIndex: 0

    property var historyItems: []

    function refreshHistory() {
        historyItems = [];
        listProcess.command = ["sh", "-c", "cliphist list -preview-lines 3 | head -200"];
        listProcess.running = true;
    }

    Process {
        id: listProcess
        running: false

        property var pendingItems: []
        property var currentEntry: null

        stdout: SplitParser {
            onRead: line => {
                const trimmed = line.trim();
                if (trimmed === "")
                    return;
                const hexWith0x = trimmed.match(/^0x[0-9a-fA-F]+\s+/);
                const hexWithout0x = trimmed.match(/^[0-9a-fA-F]+\s+/);
                const decimal = trimmed.match(/^[0-9]+\s+/);
                const idMatch = hexWith0x || hexWithout0x || decimal;

                if (idMatch) {
                    if (listProcess.currentEntry) {
                        listProcess.pendingItems.push(listProcess.currentEntry);
                    }
                    const id = idMatch[0].trim();
                    const preview = trimmed.substring(idMatch[0].length) || "";
                    listProcess.currentEntry = {
                        id,
                        preview
                    };
                    console.log("New entry:", id);
                } else {
                    if (listProcess.currentEntry) {
                        listProcess.currentEntry.preview += "\n" + trimmed;
                    } else {
                        console.warn("Continuation without current entry:", trimmed);
                    }
                }
            }
        }

        onRunningChanged: {
            if (!running) {
                if (listProcess.currentEntry) {
                    listProcess.pendingItems.push(listProcess.currentEntry);
                    listProcess.currentEntry = null;
                }

                root.historyItems = listProcess.pendingItems;

                listProcess.pendingItems = [];

                console.log("History loaded, count:", root.historyItems.length);
            }
        }
    }
    ScriptModel {
        id: filteredModel
        objectProp: "id"
        values: {
            const q = searchInput.text.trim().toLowerCase();
            if (q === "")
                return historyItems;
            return historyItems.filter(item => item.preview.toLowerCase().includes(q));
        }
    }

    function copyItem(item) {
        if (!item)
            return;
        copyProcess.command = ["sh", "-c", `cliphist decode ${item.id} | wl-copy`];
        copyProcess.running = true;
        clipboardPanel.visible = false;
    }

    Process {
        id: copyProcess
        running: false
    }

    PanelWindow {
        id: clipboardPanel
        visible: false
        focusable: true
        color: "transparent"

        WlrLayershell.layer: WlrLayer.Overlay
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive
        WlrLayershell.namespace: "quickshell-clipboard"

        exclusionMode: ExclusionMode.Ignore

        anchors {
            top: true
            bottom: true
            left: true
            right: true
        }

        MouseArea {
            anchors.fill: parent
            onClicked: clipboardPanel.visible = false

            Rectangle {
                anchors.fill: parent
                color: root.theme.bgOverlay
            }
        }

        Rectangle {
            id: popupBox
            anchors.centerIn: parent
            width: 580
            height: 480
            radius: 16
            color: root.theme.bgBase
            border.color: root.theme.bgBorder
            border.width: 1

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 12

                Text {
                    text: " Clipboard History"
                    color: root.theme.accentPrimary
                    font.pixelSize: 14
                    font.family: root.font
                    font.bold: true
                }

                Rectangle {
                    Layout.fillWidth: true
                    height: 44
                    radius: 10
                    color: root.theme.bgSurface
                    border.color: searchInput.activeFocus ? root.theme.accentPrimary : root.theme.bgBorder
                    border.width: 1

                    Behavior on border.color {
                        ColorAnimation {
                            duration: 150
                        }
                    }

                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 14
                        anchors.rightMargin: 14
                        spacing: 10

                        TextInput {
                            id: searchInput
                            Layout.fillWidth: true
                            Layout.alignment: Qt.AlignVCenter
                            color: root.theme.textPrimary
                            font.pixelSize: 15
                            font.family: root.font
                            clip: true
                            focus: true

                            Text {
                                anchors.fill: parent
                                text: "Filter history..."
                                color: root.theme.textMuted
                                font: parent.font
                                visible: !parent.text && !parent.activeFocus
                                verticalAlignment: Text.AlignVCenter
                            }

                            onTextChanged: root.selectedIndex = 0

                            Keys.onEscapePressed: clipboardPanel.visible = false

                            Keys.onPressed: event => {
                                if (event.key === Qt.Key_Down) {
                                    event.accepted = true;
                                    root.selectedIndex = Math.min(root.selectedIndex + 1, resultsList.count - 1);
                                    resultsList.positionViewAtIndex(root.selectedIndex, ListView.Contain);
                                } else if (event.key === Qt.Key_Up) {
                                    event.accepted = true;
                                    root.selectedIndex = Math.max(root.selectedIndex - 1, 0);
                                    resultsList.positionViewAtIndex(root.selectedIndex, ListView.Contain);
                                } else if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                                    event.accepted = true;
                                    if (resultsList.count > 0) {
                                        const item = filteredModel.values[root.selectedIndex];
                                        if (item)
                                            root.copyItem(item);
                                    }
                                }
                            }
                        }
                    }
                }

                Text {
                    text: resultsList.count + " item" + (resultsList.count !== 1 ? "s" : "")
                    color: root.theme.textMuted
                    font.pixelSize: 11
                    font.family: root.font
                }

                ListView {
                    id: resultsList
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    model: filteredModel
                    clip: true
                    spacing: 2
                    boundsBehavior: Flickable.StopAtBounds
                    currentIndex: root.selectedIndex
                    highlightMoveDuration: 150
                    highlightMoveVelocity: -1

                    highlight: Rectangle {
                        radius: 8
                        color: root.theme.bgSelected
                        Rectangle {
                            width: 3
                            height: 24
                            radius: 2
                            color: root.theme.accentPrimary
                            anchors.left: parent.left
                            anchors.leftMargin: 2
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                    delegate: Rectangle {
                        required property var modelData
                        required property int index

                        width: resultsList.width
                        height: Math.max(44, previewText.implicitHeight + 24)
                        radius: 8
                        color: hoverArea.containsMouse && root.selectedIndex !== index ? root.theme.bgHover : "transparent"
                        border.color: root.theme.bgBorder

                        Behavior on color {
                            ColorAnimation {
                                duration: 100
                            }
                        }

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 12
                            anchors.rightMargin: 12
                            spacing: 12

                            Text {
                                id: previewText
                                text: modelData.preview || " "
                                color: root.selectedIndex === index ? root.theme.textPrimary : root.theme.textSecondary
                                font.pixelSize: 13
                                font.family: root.font
                                wrapMode: Text.WordWrap
                                maximumLineCount: 4
                                elide: Text.ElideRight
                                Layout.fillWidth: true
                                Layout.alignment: Qt.AlignVCenter
                            }
                        }

                        MouseArea {
                            id: hoverArea
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: root.copyItem(modelData)
                            onEntered: root.selectedIndex = index
                        }
                    }

                    Text {
                        anchors.centerIn: parent
                        text: searchInput.text ? "No matches" : "No history items"
                        color: root.theme.textMuted
                        font.pixelSize: 14
                        font.family: root.font
                        visible: resultsList.count === 0
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 16

                    Row {
                        spacing: 4
                        Rectangle {
                            width: hintUp.width + 8
                            height: 18
                            radius: 4
                            color: root.theme.bgSurface
                            Text {
                                id: hintUp
                                anchors.centerIn: parent
                                text: "↑↓"
                                color: root.theme.textMuted
                                font.pixelSize: 10
                                font.family: root.font
                            }
                        }
                        Text {
                            text: "navigate"
                            color: root.theme.textMuted
                            font.pixelSize: 10
                            font.family: root.font
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                    Row {
                        spacing: 4
                        Rectangle {
                            width: hintEnter.width + 8
                            height: 18
                            radius: 4
                            color: root.theme.bgSurface
                            Text {
                                id: hintEnter
                                anchors.centerIn: parent
                                text: "⏎"
                                color: root.theme.textMuted
                                font.pixelSize: 10
                                font.family: root.font
                            }
                        }
                        Text {
                            text: "copy"
                            color: root.theme.textMuted
                            font.pixelSize: 10
                            font.family: root.font
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                    Row {
                        spacing: 4
                        Rectangle {
                            width: hintEsc.width + 8
                            height: 18
                            radius: 4
                            color: root.theme.bgSurface
                            Text {
                                id: hintEsc
                                anchors.centerIn: parent
                                text: "esc"
                                color: root.theme.textMuted
                                font.pixelSize: 10
                                font.family: root.font
                            }
                        }
                        Text {
                            text: "close"
                            color: root.theme.textMuted
                            font.pixelSize: 10
                            font.family: root.font
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }

                    Item {
                        Layout.fillWidth: true
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        // You might also want to refresh periodically, e.g., every 5 seconds
        // But for simplicity, we refresh only when toggled.
    }
}
