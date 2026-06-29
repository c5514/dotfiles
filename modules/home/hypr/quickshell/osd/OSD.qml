import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

Scope {
    id: root
    property var theme: DefaultTheme {}
    property string font: "JetBrainsMono NF"

    property bool showVolume: false
    property bool showBrightness: false
    property real volumeValue: 0
    property bool volumeMuted: false
    property real brightnessValue: 0
    property real maxBrightness: 1
    property bool _brightnessReady: false

    // PipeWire tracking
    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    Connections {
        target: Pipewire.defaultAudioSink?.audio ?? null

        function onVolumeChanged() {
            root.volumeValue = Pipewire.defaultAudioSink.audio.volume;
            root.showVolume = true;
            volumeHideTimer.restart();
        }

        function onMutedChanged() {
            root.volumeMuted = Pipewire.defaultAudioSink.audio.muted;
            root.showVolume = true;
            volumeHideTimer.restart();
        }
    }

    Timer {
        id: volumeHideTimer
        interval: 750
        onTriggered: root.showVolume = false
    }

    // Brightness monitoring
    FileView {
        id: brightnessFile
        path: ""
        watchChanges: true
        onFileChanged: brightnessReadProc.running = true
    }

    Process {
        id: brightnessReadProc
        command: ["brightnessctl", "get"]
        running: false
        stdout: StdioCollector {
            onStreamFinished: {
                const val = parseInt(text.trim());
                if (!isNaN(val) && root.maxBrightness > 0) {
                    root.brightnessValue = val / root.maxBrightness;
                    if (root._brightnessReady) {
                        root.showBrightness = true;
                        brightnessHideTimer.restart();
                    }
                    root._brightnessReady = true;
                }
            }
        }
    }

    Process {
        id: backlightDiscovery
        command: ["sh", "-c", "p=$(ls -d /sys/class/backlight/*/brightness 2>/dev/null | head -1); [ -n \"$p\" ] && echo \"$p\" && cat \"${p%brightness}max_brightness\""]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                const lines = text.trim().split("\n");
                if (lines.length >= 2) {
                    const max = parseInt(lines[1]);
                    if (!isNaN(max) && max > 0)
                        root.maxBrightness = max;
                    brightnessFile.path = lines[0];
                    brightnessReadProc.running = true;
                }
            }
        }
    }

    Timer {
        id: brightnessHideTimer
        interval: 750
        onTriggered: root.showBrightness = false
    }

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            visible: root.showVolume || root.showBrightness
            focusable: false
            color: "transparent"

            WlrLayershell.layer: WlrLayer.Overlay
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
            WlrLayershell.namespace: "quickshell-osd"

            exclusionMode: ExclusionMode.Ignore
            mask: Region {}

            anchors.bottom: true

            implicitWidth: 250
            implicitHeight: 70
            margins.bottom: screen.height / 10

            Rectangle {
                anchors.fill: parent
                radius: height / 2
                color: "#99000000"
                RowLayout {
                    opacity: root.showBrightness ? 1 : 0
                    anchors.fill: parent
                    anchors.leftMargin: 10
                    anchors.rightMargin: 15
                    spacing: 10
                    Text {
                        text: {
                            let bright = root.brightnessValue ?? 0;
                            if (bright < 0.33)
                                return "󰃞";
                            if (bright < 0.66)
                                return "󰃟";
                            return "󰃠";
                        }
                        color: "#ffffff"
                        font.pixelSize: 35
                        font.family: root.font
                        Layout.alignment: Qt.AlignHCenter
                    }
                    Rectangle {
                        Layout.fillWidth: true
                        implicitHeight: 10
                        radius: 20
                        color: "#50ffffff"
                        Rectangle {
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            width: Math.max(0, (parent.width - 4) * Math.max(0, Math.min(1, root.brightnessValue)))
                            radius: parent.radius
                            color: "#ffffff"
                            Behavior on width {
                                NumberAnimation {
                                    duration: 50
                                }
                            }
                        }
                    }
                }
                RowLayout {
                    opacity: root.showVolume ? 1 : 0
                    anchors.fill: parent
                    anchors.leftMargin: 10
                    anchors.rightMargin: 15
                    spacing: 10
                    IconImage {
                        implicitSize: 30
                        source: {
                            let audio = root.volumeValue;
                            if (!audio)
                                return "";
                            if (root.volumeMuted)
                                return Quickshell.iconPath("audio-volume-muted");
                            let vol = root.volumeValue ?? 0;
                            if (vol < 0.5)
                                return Quickshell.iconPath("audio-volume-low");
                            return Quickshell.iconPath("audio-volume-high");
                        }
                    }
                    // Text {
                    //   text: {
                    //     if (root.volumeMuted || root.volumeValue <= 0) return "󰖁";
                    //     if (root.volumeValue < 0.33) return "󰕿";
                    //     if (root.volumeValue < 0.66) return "󰖀";
                    //     return "󰕾";
                    //   }
                    //   color: root.volumeMuted ? root.theme.textMuted : "#ffffff"
                    //   font.pixelSize: 40
                    //   font.family: root.font
                    //   Layout.alignment: Qt.AlignHCenter
                    // }
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
                                let audio = root.volumeValue;
                                if (!audio)
                                    return 0;
                                let vol = root.volumeMuted ? 0 : (root.volumeValue ?? 0);
                                return parent.width * vol;
                            }
                            radius: parent.radius
                            color: "#ffffff"
                            Behavior on width {
                                NumberAnimation {
                                    duration: 50
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
