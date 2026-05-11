import QtQuick
import Quickshell
import Quickshell.Io

Scope {
Process {
        id: runner
    }

    function run(cmd) {
        runner.command = ["bash", "-c", cmd]
        runner.running = true
    }
    PanelWindow {
        id: toplevel
        focusable: true
        aboveWindows: true

        anchors {
            top: true
            left: true
            right: true
        }

        implicitHeight: 0
        color: "transparent"

        PopupWindow {
            anchor.window: toplevel
            color: "transparent"
            implicitWidth: 400
            implicitHeight: 80

            anchor.rect.x: parentWindow.width / 2 - width / 2
            anchor.rect.y: 50   // distance from top

            visible: true
Rectangle {
    anchors.fill: parent
    radius: 12
    color: "#cc121212"
    border.width: 1
    border.color: "#444b6a"
Row {
    anchors.centerIn: parent
    spacing: 12

    Repeater {
        model: [
            { label: "A", cmd: "foot" },
            { label: "B", cmd: "hyprlock" },
            { label: "C", cmd: "hyprctl dispatch exit" },
            { label: "D", cmd: "systemctl reboot" },
            { label: "E", cmd: "systemctl poweroff" }
        ]

        delegate: Rectangle {
            implicitWidth: 60
            implicitHeight: 40
            radius: 8
            color: "#222"

            Text {
                anchors.centerIn: parent
                text: modelData.label
                color: "white"
                font.bold: true
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                onEntered: parent.color = "#333"
                onExited: parent.color = "#222"

                onClicked: run(modelData.cmd)
            }
        }
    }
}
}
        }
    }
}
