import Quickshell
import QtQuick
import "./modules/bar/"
import "./modules/osd/"
import "./modules/powermenu/"
// import "./modules/powermenu" as PM
ShellRoot {
    Bar { }

    Volume {
      id: volumeOsd
    }
  //   Powermenu {
  //   id: powerMenu
  // }
}
