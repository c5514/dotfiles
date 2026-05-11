import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets

Scope {
    id: root

    property bool shouldShowOsd: false

    function triggerOsd() {
        root.shouldShowOsd = true
        hideTimer.restart()
    }

    // Ensure PipeWire objects are tracked
    PwObjectTracker {
        objects: [ Pipewire.defaultAudioSink ]
    }

    // Stable reference (important)
    property var audio: Pipewire.defaultAudioSink
        ? Pipewire.defaultAudioSink.audio
        : null

    // React to changes safely
    Connections {
        target: root.audio

        // Only connect if object exists
        enabled: target !== null

        function onVolumeChanged() {
            root.triggerOsd()
        }

        function onMutedChanged() {
            root.triggerOsd()
        }
    }

    Timer {
        id: hideTimer
        interval: 1000
        repeat: false
        onTriggered: root.shouldShowOsd = false
    }

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
                color: "#99000000"

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 10
                    anchors.rightMargin: 15
                    spacing: 10

                    // -------- ICON --------
                    IconImage {
                        implicitSize: 30

                        source: {
                            let audio = root.audio
                            if (!audio) return ""

                            if (audio.muted)
                                return Quickshell.iconPath("audio-volume-muted")

                            let vol = audio.volume ?? 0

                            if (vol < 0.5)
                                return Quickshell.iconPath("audio-volume-low")

                            return Quickshell.iconPath("audio-volume-high")
                        }
                    }

                    // -------- BAR --------
                    Rectangle {
                        Layout.fillWidth: true
                        implicitHeight: 10
                        radius: 20
                        color: "#50ffffff"

                        Rectangle {
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom

                            width: {
                                let audio = root.audio
                                if (!audio) return 0

                                let vol = audio.muted ? 0 : (audio.volume ?? 0)
                                return parent.width * vol
                            }

                            radius: parent.radius
                            color: "#ffffff"

                            // Smooth animation
                            Behavior on width {
                                NumberAnimation { duration: 120 }
                            }
                        }
                    }
                }
            }
        }
    }
}
