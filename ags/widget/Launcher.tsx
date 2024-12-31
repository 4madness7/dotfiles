import { App, Astal, Gtk } from "astal"
import Apps from "gi://AstalApps"

const apps = new Apps.Apps({
    includeEntry: true,
    includeExecutable: true,
})

// for (const app of apps.fuzzy_query("")) {
//     const res = app.fuzzy_match("vim")
//     // print(app.name)
//     const total = res.name + res.description + res.executable + res.entry
// }
//

function createList(query: string = ""): AppItem[] {
    let list: AppItem[] = [];
    for (const app of apps.fuzzy_query(query)) {
        list.push({ app: app, widget: appItem(app) })
    }
    return list;
}

type AppItem = {
    app: Apps.Application;
    widget: Gtk.Widget;
}

const test: AppItem[] = createList();

test.sort((a, b) => a.app.name.toLowerCase().localeCompare(b.app.name.toLowerCase()));

function appItem(app: Apps.Application) {
    return <button onClick={() => app.launch()} className="AppButton">
        <box spacing={16}>
            <icon icon={app.icon_name} className="AppIcon" />
            {app.name}
        </box>
    </button>
}

export default function Launcher(monitor: number) {
    return <window
        name={"test" + monitor}
        monitor={monitor}
        application={App}
        keymode={Astal.Keymode.ON_DEMAND}
        onKeyPressEvent={(window, evt) => {
            print(evt.get_keyval()[1], String.fromCharCode(evt.get_keyval()[1]))
            const keycode = evt.get_keycode()[1];
            // print(keycode)
            if (keycode === 9) {
                window.hide()
            }
        }}
    >
        <box
            height_request={350}
            width_request={400}
            vertical={true}
        >
            <entry
                placeholder_text={"Search..."}
                visibility={true}
                is_focus={true}
                onChanged={({ text }) => {
                    for (let i = 0; i < test.length; i++) {
                        test[i].widget.visible = test[i].app.name.toLowerCase().match(text.toLowerCase()) !== null;
                    }
                }}
            />
            <scrollable
                hscroll={Gtk.PolicyType.NEVER}
                vscroll={Gtk.PolicyType.ALWAYS}
            >
                <box
                    vertical={true}
                    vexpand={true}
                >
                    {test.map(item => item.widget)}
                </box>
            </scrollable>
        </box>
    </window>
}
