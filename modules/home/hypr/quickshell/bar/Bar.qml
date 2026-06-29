import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import Quickshell.Io
import Quickshell.Services.Mpris
import Quickshell.Services.Pipewire

Scope {
    id: root
    property var theme: DefaultTheme {}
    property string font: "JetBrainsMono NF"
    property bool barVisible: true

    // MPRIS active player
    property var activePlayer: {
        const players = Mpris.players.values;
        if (!players || players.length === 0)
            return null;
        for (const p of players) {
            if (p.playbackState === MprisPlaybackState.Playing)
                return p;
        }
        return players[0];
    }
    Process {
        id: calendarToggle
        command: ["qs", "ipc", "call", "calendar", "toggle"]
    }

    IpcHandler {
        target: "bar"
        function toggle(): void {
            root.barVisible = !root.barVisible;
        }
    }

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData
            visible: root.barVisible

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 32
            color: root.theme.bgBase

            Item {
                anchors.fill: parent
                anchors.leftMargin: 10
                anchors.rightMargin: 10

                // Left section: Workspaces + Now Playing
                Row {
                    id: leftSection
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 8

                    // Workspaces
                    Row {
                        spacing: 4

                        Repeater {
                            model: (Hyprland.workspaces?.values ?? []).filter(w => w.id > 0)

                            Rectangle {
                                id: wsPill
                                required property var modelData
                                property bool urgentBlink: false

                                Accessible.role: Accessible.Button
                                Accessible.name: "Workspace " + modelData.id + (modelData.focused ? ", active" : "") + (modelData.urgent ? ", urgent" : "")

                                width: modelData.focused ? 32 : 24
                                height: 24
                                radius: 12
                                color: modelData.focused ? root.theme.accentPrimary : modelData.urgent && urgentBlink ? root.theme.accentRed : root.theme.bgSurface

                                Behavior on color {
                                    ColorAnimation {
                                        duration: 150
                                    }
                                }

                                SequentialAnimation {
                                    loops: Animation.Infinite
                                    running: wsPill.modelData.urgent && !wsPill.modelData.focused

                                    PropertyAction {
                                        target: wsPill
                                        property: "urgentBlink"
                                        value: true
                                    }
                                    PauseAnimation {
                                        duration: 500
                                    }
                                    PropertyAction {
                                        target: wsPill
                                        property: "urgentBlink"
                                        value: false
                                    }
                                    PauseAnimation {
                                        duration: 500
                                    }

                                    onStopped: wsPill.urgentBlink = false
                                }

                                Text {
                                    anchors.centerIn: parent
                                    text: wsPill.modelData.id
                                    color: wsPill.modelData.focused ? root.theme.bgBase : root.theme.textPrimary
                                    font.pixelSize: 14
                                    font.family: root.font
                                    font.bold: wsPill.modelData.focused
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: wsPill.modelData.activate()
                                }

                                Behavior on width {
                                    NumberAnimation {
                                        duration: 150
                                    }
                                }
                            }
                        }
                    }

                    // Now Playing
                    Rectangle {
                        height: 24
                        width: nowPlayingContent.width + 16
                        radius: 12
                        color: root.theme.bgSurface
                        visible: root.activePlayer !== null

                        Accessible.role: Accessible.Button
                        Accessible.name: {
                            if (!root.activePlayer)
                                return "No media";
                            const artist = root.activePlayer.trackArtist || "";
                            const title = root.activePlayer.trackTitle || "";
                            return "Now playing: " + (artist ? artist + " - " : "") + title;
                        }

                        Row {
                            id: nowPlayingContent
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 8
                            spacing: 6

                            Text {
                                anchors.verticalCenter: parent.verticalCenter
                                text: root.activePlayer && root.activePlayer.isPlaying ? "󰐊" : "󰏤"
                                color: root.theme.accentPrimary
                                font.pixelSize: 16
                                font.family: root.font
                            }

                            Text {
                                anchors.verticalCenter: parent.verticalCenter
                                text: {
                                    if (!root.activePlayer)
                                        return "";
                                    const artist = root.activePlayer.trackArtist || "";
                                    const title = root.activePlayer.trackTitle || "";
                                    return artist ? artist + " - " + title : title;
                                }
                                color: root.theme.textPrimary
                                font.pixelSize: 13
                                font.family: root.font
                                elide: Text.ElideRight
                                width: Math.min(implicitWidth, 400)
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: root.activePlayer.togglePlaying()
                        }
                    }
                }

                // Center section: Window Title (truly centered in bar)
                // Time
                Rectangle {
                    height: 24
                    anchors.centerIn: parent
                    width: timeDate.width + 16
                    radius: 12
                    color: root.theme.bgSurface
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            calendarToggle.running = true;
                        }
                    }
                    Row {
                        id: timeDate
                        anchors.centerIn: parent
                        spacing: 8

                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            text: ""
                            color: root.theme.accentPrimary
                            font.pixelSize: 14
                            font.family: root.font
                        }

                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            text: Time.timeString
                            color: root.theme.textPrimary
                            font.pixelSize: 14
                            font.family: root.font
                        }

                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            text: Time.dateString
                            color: root.theme.textSecondary
                            font.pixelSize: 13
                            font.family: root.font
                        }
                    }
                }
                // Right section: System Info + System Tray
                Row {
                    id: rightSection
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 8

                    // System Tray
                    Rectangle {
                        implicitHeight: 24
                        implicitWidth: trayIcons.implicitWidth + 4
                        radius: 12
                        color: root.theme.bgSurface

                        RowLayout {
                            id: trayIcons
                            anchors.centerIn: parent
                            spacing: 2

                            Repeater {
                                model: SystemTray.items

                                MouseArea {
                                    id: trayDelegate
                                    required property SystemTrayItem modelData

                                    Accessible.role: Accessible.Button
                                    Accessible.name: modelData.tooltipTitle || modelData.title || "System tray item"

                                    Layout.preferredWidth: 24
                                    Layout.preferredHeight: 24

                                    acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton

                                    onClicked: mouse => {
                                        if (mouse.button === Qt.LeftButton) {
                                            modelData.activate();
                                        } else if (mouse.button === Qt.RightButton) {
                                            if (modelData.hasMenu) {
                                                menuAnchor.open();
                                            }
                                        } else if (mouse.button === Qt.MiddleButton) {
                                            modelData.secondaryActivate();
                                        }
                                    }

                                    IconImage {
                                        anchors.centerIn: parent
                                        source: trayDelegate.modelData.icon
                                        implicitSize: 16
                                    }

                                    QsMenuAnchor {
                                        id: menuAnchor
                                        menu: trayDelegate.modelData.menu

                                        anchor.window: trayDelegate.QsWindow.window
                                        anchor.adjustment: PopupAdjustment.Flip
                                        anchor.onAnchoring: {
                                            const window = trayDelegate.QsWindow.window;
                                            const widgetRect = window.contentItem.mapFromItem(trayDelegate, 0, trayDelegate.height, trayDelegate.width, trayDelegate.height);
                                            menuAnchor.anchor.rect = widgetRect;
                                        }
                                    }
                                }
                            }
                        }
                    }
                    // System Info
                    Row {
                        id: sysInfo

                        readonly property color batteryColor: {
                            if (SystemInfo.batteryCharging)
                                return root.theme.accentGreen;
                            if (SystemInfo.batteryLevelRaw > 20)
                                return root.theme.batteryGood;
                            if (SystemInfo.batteryLevelRaw > 10)
                                return root.theme.batteryWarning;
                            return root.theme.batteryCritical;
                        }

                        spacing: 4
                        // Power-profiles
                        Rectangle {
                            height: 24
                            width: powerContent.width + 12
                            radius: 12
                            color: root.theme.bgSurface

                            Accessible.role: Accessible.Button
                            Accessible.name: "Power profile: " + SystemInfo.powerProfile

                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: SystemInfo.cyclePowerProfile()
                            }

                            Row {
                                id: powerContent
                                anchors.centerIn: parent
                                spacing: 6

                                Text {
                                    text: SystemInfo.powerProfileIcon
                                    color: {
                                        switch (SystemInfo.powerProfile) {
                                        case "performance":
                                            return root.theme.accentRed;
                                        case "balanced":
                                            return root.theme.accentCyan;
                                        case "power-saver":
                                            return root.theme.accentGreen;
                                        default:
                                            return root.theme.textPrimary;
                                        }
                                    }
                                    font.pixelSize: 14
                                    font.family: root.font
                                }
                            }
                        }
                        // CPU
                        Rectangle {
                            height: 24
                            width: cpuContent.width + 12
                            radius: 12
                            color: root.theme.bgSurface
                            Accessible.role: Accessible.StaticText
                            Accessible.name: "CPU: " + SystemInfo.cpuUsage

                            Row {
                                id: cpuContent
                                anchors.centerIn: parent
                                spacing: 6

                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: ""
                                    color: root.theme.accentOrange
                                    font.pixelSize: 14
                                    font.family: root.font
                                }
                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: SystemInfo.cpuUsage
                                    color: root.theme.textPrimary
                                    font.pixelSize: 13
                                    font.family: root.font
                                }
                            }
                        }

                        // Network
                        Rectangle {
                            height: 24
                            width: netContent.width + 12
                            radius: 12
                            color: root.theme.bgSurface
                            Accessible.role: Accessible.StaticText
                            Accessible.name: {
                                if (SystemInfo.networkType === "ethernet")
                                    return "Network: Ethernet";
                                if (SystemInfo.networkType === "wifi")
                                    return "Network: WiFi " + SystemInfo.networkInfo;
                                return "Network: Disconnected";
                            }

                            Row {
                                id: netContent
                                anchors.centerIn: parent
                                spacing: 6

                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: {
                                        if (SystemInfo.networkType === "ethernet")
                                            return "󰈀";
                                        if (SystemInfo.networkType === "wifi")
                                            return "󰖩";
                                        return "󰖪";
                                    }
                                    color: SystemInfo.networkType === "disconnected" ? root.theme.textMuted : root.theme.accentGreen
                                    font.pixelSize: 14
                                    font.family: root.font
                                }
                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: SystemInfo.networkInfo
                                    color: root.theme.textPrimary
                                    font.pixelSize: 13
                                    font.family: root.font
                                }
                            }
                        }

                        // Battery
                        Rectangle {
                            height: 24
                            width: battContent.width + 12
                            radius: 12
                            color: root.theme.bgSurface
                            Accessible.role: Accessible.StaticText
                            Accessible.name: "Battery: " + SystemInfo.batteryLevel

                            Row {
                                id: battContent
                                anchors.centerIn: parent
                                spacing: 6

                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: SystemInfo.batteryIcon
                                    color: sysInfo.batteryColor
                                    font.pixelSize: 14
                                    font.family: root.font
                                }
                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: SystemInfo.batteryLevel
                                    color: root.theme.textPrimary
                                    font.pixelSize: 13
                                    font.family: root.font
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
