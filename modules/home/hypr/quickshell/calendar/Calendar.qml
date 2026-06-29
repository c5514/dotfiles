import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Widgets
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Scope {
    id: root
    property var theme: DefaultTheme {}
    property string font: "JetBrainsMono NF"
    property int barHeight: 30

    // ---- IPC toggle ----
    IpcHandler {
        target: "calendar"
        function toggle(): void {
            calendarPanel.visible = !calendarPanel.visible;
            if (calendarPanel.visible) {
                currentDate = new Date();
                selectedDate = new Date();
                calendarPanel.forceActiveFocus();
            }
        }
    }

    // ---- Calendar state ----
    property date currentDate: new Date()
    property date selectedDate: new Date()

    function daysInMonth(date) {
        return new Date(date.getFullYear(), date.getMonth() + 1, 0).getDate();
    }

    function firstDayOfMonth(date) {
        return new Date(date.getFullYear(), date.getMonth(), 1).getDay();
    }

    function previousMonth() {
        currentDate = new Date(currentDate.getFullYear(), currentDate.getMonth() - 1, 1);
    }

    function nextMonth() {
        currentDate = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 1);
    }

    function isToday(date) {
        const today = new Date();
        return date.getFullYear() === today.getFullYear() && date.getMonth() === today.getMonth() && date.getDate() === today.getDate();
    }

    function isSelected(date) {
        return date.getFullYear() === selectedDate.getFullYear() && date.getMonth() === selectedDate.getMonth() && date.getDate() === selectedDate.getDate();
    }

    // ---- Calendar popup window ----
    PanelWindow {
        id: calendarPanel
        visible: false
        focusable: true
        color: "transparent"

        WlrLayershell.layer: WlrLayer.Overlay
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive
        WlrLayershell.namespace: "quickshell-calendar"
        exclusionMode: ExclusionMode.Ignore

        anchors {
            top: true
            bottom: true
            left: true
            right: true
        }

        // Dark backdrop (click to close)
        MouseArea {
            anchors.fill: parent
            onClicked: calendarPanel.visible = false

            Rectangle {
                anchors.fill: parent
                color: root.theme.bgOverlay
            }
        }

        // ---- Calendar box – TOP‑ALIGNED ----
        Rectangle {
            id: calendarBox
            // Anchor to the top, just below the bar
            anchors {
                top: parent.top
                topMargin: root.barHeight + 8   // 8px gap below bar
                horizontalCenter: parent.horizontalCenter
            }
            width: 380
            // Height fits content – we'll use implicitHeight from the ColumnLayout
            height: columnLayout.implicitHeight + 32   // padding included
            radius: 16
            color: root.theme.bgBase
            border.color: root.theme.bgBorder
            border.width: 1

            ColumnLayout {
                id: columnLayout
                anchors.fill: parent
                anchors.margins: 16
                spacing: 12

                // Header: month/year and navigation
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    Text {
                        text: {
                            const months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
                            return months[currentDate.getMonth()] + " " + currentDate.getFullYear();
                        }
                        color: root.theme.textPrimary
                        font.pixelSize: 18
                        font.family: root.font
                        font.bold: true
                        Layout.fillWidth: true
                    }

                    Row {
                        spacing: 4
                        Button {
                            width: 32
                            height: 32

                            background: Rectangle {
                                radius: 6
                                color: parent.hovered ? root.theme.bgHover : "transparent"
                            }

                            contentItem: Text {
                                text: "◀"
                                color: root.theme.textPrimary
                                font.pixelSize: 14
                                font.family: root.font
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }

                            onClicked: nextMonth()
                        }
                        Button {
                            width: 32
                            height: 32

                            background: Rectangle {
                                radius: 6
                                color: parent.hovered ? root.theme.bgHover : "transparent"
                            }

                            contentItem: Text {
                                text: "▶"
                                color: root.theme.textPrimary
                                font.pixelSize: 14
                                font.family: root.font
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }

                            onClicked: nextMonth()
                        }
                    }
                }

                // Day-of-week headers
                GridLayout {
                    Layout.fillWidth: true
                    columns: 7
                    columnSpacing: 4
                    rowSpacing: 4

                    Repeater {
                        model: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
                        Text {
                            text: modelData
                            color: root.theme.textMuted
                            font.pixelSize: 11
                            font.family: root.font
                            font.bold: true
                            horizontalAlignment: Text.AlignHCenter
                            Layout.fillWidth: true
                        }
                    }
                }

                // Calendar grid
                GridLayout {
                    Layout.fillWidth: true
                    // Remove Layout.fillHeight: true – let it size to its content
                    columns: 7
                    columnSpacing: 4
                    rowSpacing: 4

                    Repeater {
                        id: dayRepeater
                        model: {
                            const first = firstDayOfMonth(currentDate);
                            const total = daysInMonth(currentDate);
                            const offset = (first === 0) ? 6 : first - 1;
                            return offset + total;
                        }

                        delegate: Rectangle {
                            required property int index
                            width: (calendarBox.width - 32) / 7 - 4
                            height: width
                            radius: 8
                            color: {
                                const day = index - (firstDayOfMonth(currentDate) === 0 ? 6 : firstDayOfMonth(currentDate) - 1) + 1;
                                if (day < 1 || day > daysInMonth(currentDate))
                                    return "transparent";
                                const date = new Date(currentDate.getFullYear(), currentDate.getMonth(), day);
                                if (isSelected(date))
                                    return root.theme.accentPrimary;
                                if (isToday(date))
                                    return root.theme.bgSelected;
                                return "transparent";
                            }
                            border.color: isToday(new Date(currentDate.getFullYear(), currentDate.getMonth(), index - (firstDayOfMonth(currentDate) === 0 ? 6 : firstDayOfMonth(currentDate) - 1) + 1)) ? root.theme.accentPrimary : "transparent"
                            border.width: 2

                            Text {
                                anchors.centerIn: parent
                                text: {
                                    const day = index - (firstDayOfMonth(currentDate) === 0 ? 6 : firstDayOfMonth(currentDate) - 1) + 1;
                                    if (day < 1 || day > daysInMonth(currentDate))
                                        return "";
                                    return day;
                                }
                                color: {
                                    const day = index - (firstDayOfMonth(currentDate) === 0 ? 6 : firstDayOfMonth(currentDate) - 1) + 1;
                                    if (day < 1 || day > daysInMonth(currentDate))
                                        return root.theme.textMuted;
                                    const date = new Date(currentDate.getFullYear(), currentDate.getMonth(), day);
                                    if (isSelected(date))
                                        return root.theme.bgBase;
                                    return root.theme.textPrimary;
                                }
                                font.pixelSize: 13
                                font.family: root.font
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }

                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    const day = index - (firstDayOfMonth(currentDate) === 0 ? 6 : firstDayOfMonth(currentDate) - 1) + 1;
                                    if (day >= 1 && day <= daysInMonth(currentDate)) {
                                        selectedDate = new Date(currentDate.getFullYear(), currentDate.getMonth(), day);
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // Keyboard shortcut to close (on the box itself, but the panel will also catch it)
            Keys.onEscapePressed: calendarPanel.visible = false
            focus: true
        }
    }
}
