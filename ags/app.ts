import { App } from "astal"
import style from "inline:./style.css"
import Bar from "./widget/Bar"
import Launcher from "./widget/Launcher"
// import Apps from "gi://AstalApps"
// import Battery from "gi://AstalBattery"
//
// const battery = Battery.get_default()
//
// print(battery.percentage)

// const apps = new Apps.Apps({
//     includeEntry: true,
//     includeExecutable: true,
// })
//
// for (const app of apps.fuzzy_query("vim")) {
//     print(app.iconName, "-", app.name)
// }

App.start({
    css: style,
    main() {
        Bar(1)
        Launcher(1);
        // Bar(1) // initialize other monitors
    },
})
