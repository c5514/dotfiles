import Quickshell
import Quickshell.Io
import QtQuick
import "bar"
import "app-launcher"
import "notifications"
import "theme-switcher"
import "wallpaper"
import "osd"
import "monitor-manager"
import "utils"
import "powermenu"
import "clipboard"
import "calendar"

Scope {
    ThemeSwitcher {
        id: ts
    }
    Bar {
        theme: ts.theme
    }
    AppLauncher {
        theme: ts.theme
    }
    NotificationPopup {
        theme: ts.theme
    }
    WallpaperManager {
        theme: ts.theme
    }
    OSD {
        theme: ts.theme
    }
    MonitorManager {
        theme: ts.theme
    }
    Utils {
        theme: ts.theme
    }
    Powermenu {
        theme: ts.theme
    }
    Clipboard {
        theme: ts.theme
    }
    Calendar {
        theme: ts.theme
    }
}
