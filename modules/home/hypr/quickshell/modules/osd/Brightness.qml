import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Widgets

Scope {
    id: root

    property int brightness: 0          // current %
    property int lastBrightness: -1     // to detect changes
    property bool shouldShowOsd: false

    // -----------------------------
    // READ BRIGHTNESS (robust)
    // -----------------------------
    Process {
        id: brightnessGet
        command: ["brightnessctl", "-m"]

        onExited: {
            if (!stdout) return

            // Example output:
            // backlight,intel_backlight,937,12000,7%
            let parts = stdout.trim().split(",")

            if (parts.length >= 4) {
                let pct = parseInt(parts[3])  // "7%" → 7

                if (!isNaN(pct) && pct !== root.lastBrightness) {
                    root.brightness = pct
                    root.lastBrightness = pct

                    root.shouldShowOsd = true
                    hideTimer.restart()
                }
            }
        }
    }

    // -----------------------------
    // POLLING (brightness has no events)
    // -----------------------------
    Timer {
        interval: 300   // fast enough to feel instant
        running: true
        repeat: true

        onTriggered: brightnessGet.running = true
    }

    Component.onCompleted: brightnessGet.running = true

    // -----------------------------
    // OSD VISIBILITY
    // -----------------------------
    Timer {
        id: hideTimer
        interval: 1000
        onTriggered: root.shouldShowOsd = false
    }

    // -----------------------------
    // OSD UI
    // -----------------------------
    LazyLoader {
        active: root.shouldShowOsd

        PanelWindow {
            anchors.bottom: true
            margins.bottom: screen.height / 10
            exclusiveZone: 0

            implicitWidth: 250
            implicitHeight: 50
            color: "transparent"

            mask: Region {}

            Rectangle {
                anchors.fill: parent
                radius: height / 2
                color: "#80000000"

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 12
                    anchors.rightMargin: 12
                    spacing: 10

                    // Icon
                    IconImage {
                        implicitSize: 28
                        source: Quickshell.iconPath("display-brightness-symbolic")
                    }

                    // Bar background
                    Rectangle {
                        Layout.fillWidth: true
                        implicitHeight: 10
                        radius: 10
                        color: "#50ffffff"

                        // Fill
                        Rectangle {
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom

                            width: parent.width * (root.brightness / 100)
                            radius: parent.radius
                            color: "#ffffff"

                            // smooth animation
                            Behavior on width {
                                NumberAnimation { duration: 120 }
                            }
                        }
                    }

                    // Percentage text
                    Text {
                        text: root.brightness + "%"
                        color: "white"
                        font.pixelSize: 14
                        font.bold: true
                    }
                }
            }
        }
    }
}
