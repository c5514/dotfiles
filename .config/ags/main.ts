import "lib/session"
import "style/style"
import init from "lib/init"
import options from "options"
import OSD from "widget/osd/OSD"
import { forMonitors } from "lib/utils"

App.config({
    onConfigParsed: () => {
        init()
    },
   windows: () => [
        ...forMonitors(OSD),
    ],
})
