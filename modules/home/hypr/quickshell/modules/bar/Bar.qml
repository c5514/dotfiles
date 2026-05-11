import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower
import Quickshell.Services.SystemTray

PanelWindow {
    id: root

    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 34

    margins {
        top: 2
        right: 2
        left: 2
    }

    // Theme
    property color colBg: "#121212"
    property color colWhite: "#e0e0e0"
    property color colMuted: "#444b6a"
    property color colBlue: "#7aa2f7"
    property color colDarkBlue: "#0096FF"
    property color colYellow: "#e0af68"

    property string fontFamily: "JetBrainsMono Nerd Font"
    property int fontSize: 14

    color: "transparent"

    Rectangle {
        anchors.fill: parent
        radius: 15
        color: root.colBg
        border.width: 1
        border.color: root.colMuted

        Item {
            anchors.fill: parent

            // =========================
            // LEFT + RIGHT LAYOUT
            // =========================
            RowLayout {
                anchors.fill: parent
                anchors.margins: 8
                spacing: 5

                // -------- LEFT: WORKSPACES --------
                Repeater {
                  model: (Hyprland.workspaces?.values ?? []).filter(w => w.id > 0)

                    delegate: Rectangle {
                        required property var modelData

                        property bool isActive:
                            modelData.id === Hyprland.focusedWorkspace?.id

                        implicitWidth: 20
                        implicitHeight: 20
                        radius: 10

                        color: isActive
                            ? Qt.rgba(root.colDarkBlue.r, root.colDarkBlue.g, root.colDarkBlue.b, 0.6)
                            : Qt.rgba(root.colDarkBlue.r, root.colDarkBlue.g, root.colDarkBlue.b, 0.2)

                        border.width: 1
                        border.color: root.colBlue

                        Layout.alignment: Qt.AlignVCenter

                        Text {
                            anchors.centerIn: parent
                            text: modelData.id
                            color: root.colWhite
                            font {
                                family: root.fontFamily
                                pixelSize: root.fontSize
                                bold: true
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: parent.opacity = 0.8
                            onExited: parent.opacity = 1.0
                            onClicked:
                                Hyprland.dispatch("workspace " + modelData.id)
                        }
                    }
                  }
                // Spacer pushes battery to right
                Item { Layout.fillWidth: true }

                // -------- RIGHT: BATTERY --------
                Row {
    id: tray
    spacing: 6

    Repeater {
        model: SystemTray.items

        delegate: Item {
            required property var modelData   // SystemTrayItem

            width: 20
            height: 20

Image {
    anchors.fill: parent
    fillMode: Image.PreserveAspectFit

    source: {
        if (!modelData.icon)
            return ""

        let icon = modelData.icon.toString()

        // Ignore unsupported "?path=" icons (the source of your warning)
        if (icon.includes("?path="))
            return ""

        return icon
    }
}

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                onClicked: modelData.activate()


            }

        }
    }
}
                Text {
                    id: battery
                    property var dev: UPower.displayDevice

                    visible: dev.ready && dev.isLaptopBattery

                    color: root.colWhite

                    font {
                        family: root.fontFamily
                        pixelSize: root.fontSize
                        bold: true
                    }

                    text: {
                        if (!dev || !dev.ready) return ""

                        let pct = Math.round(dev.percentage * 100)

                        function batteryIcon(p) {
                            if (p <= 10) return ""
                            if (p <= 25) return ""
                            if (p <= 50) return ""
                            if (p <= 75) return ""
                            return ""
                        }

                        function chargingIcon(p) {
                            if (p <= 10) return "󰢜"
                            if (p <= 25) return "󰂇"
                            if (p <= 40) return "󰂈"
                            if (p <= 55) return "󰢝"
                            if (p <= 70) return "󰂉"
                            if (p <= 85) return "󰢞"
                            if (p <= 95) return "󰂊"
                            return "󰂋"
                        }

                        if (dev.state === 1) {
                            return chargingIcon(pct) + " " + pct + "%"
                        }

                        if (dev.state === 4) {
                            return " " + pct + "%"
                        }

                        return batteryIcon(pct) + " " + pct + "%"
                    }
                }
            }

            // =========================
            // CENTER: CLOCK (ABSOLUTE)
            // =========================
            Text {
                id: clock

                anchors.centerIn: parent

                color: root.colWhite

                font {
                    family: root.fontFamily
                    pixelSize: root.fontSize
                    bold: true
                }

                text: Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")

                Timer {
                    interval: 1000
                    running: true
                    repeat: true
                    onTriggered:
                        clock.text = Qt.formatDateTime(
                            new Date(),
                            "ddd, MMM dd - HH:mm"
                        )
                }
            }
        }
    }
}
