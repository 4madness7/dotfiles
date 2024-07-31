const battery = await Service.import('battery')
const network = await Service.import('network')
const audio = await Service.import('audio')

const date = Variable("", {
    poll: [1000, 'date "+%d %b %y | %H:%M "'],
})

function Clock() {
    return Widget.Label({
        label: date.bind().as(n => {
            let datePartials = n.split(" ")
            datePartials[1] = datePartials[1].substring(0, 1).toUpperCase() + datePartials[1].substring(1, datePartials.length)
            return datePartials.join(" ");
        })
    })
}

function BatteryLabel() {
    const icon = battery.bind("percent").as(p =>
        `battery-level-${Math.floor(p / 10) * 10}-symbolic`)

    return Widget.Box({
        class_name: "battery",
        visible: battery.bind("available"),
        children: [
            Widget.Label({
                label: battery.bind("percent").as((v) => v + "%")
            }),
            Widget.Icon({ icon }),
        ],
    })
}

function WifiIndicator() {
    return Widget.Icon({
        icon: network.wifi.bind('icon_name'),
        tooltipText: network.wifi.ssid,
    })
}

function WiredIndicator() {
    return Widget.Icon({
        icon: network.wired.bind('icon_name'),
    })
}

function NetworkIndicator() {
    return Widget.Stack({
        children: {
            wifi: WifiIndicator(),
            wired: WiredIndicator(),
        },
        shown: network.bind('primary').as(p => p || 'wifi'),
    })
}

function volumeIndicator() {
    const vol = audio.speaker.volume * 100;
    return Widget.Button({
        on_clicked: () => audio.speaker.is_muted = !audio.speaker.is_muted,
        child: Widget.Icon().hook(audio.speaker, self => {
            const icon = [
                [101, 'overamplified'],
                [67, 'high'],
                [34, 'medium'],
                [1, 'low'],
                [0, 'muted'],
            ].find(([threshold]) => { if (typeof threshold === "number") return threshold <= vol })?.[1];

            self.icon = `audio-volume-${icon}-symbolic`;
            self.tooltip_text = `Volume ${Math.floor(vol)}%`;
        }),
    })
}

function Left(/** @type {number} */ monitor) {
    return Widget.Box({
        spacing: 8,
        children: [
        ],
    })
}

function Center() {
    return Widget.Box({
        spacing: 8,
        children: [
        ],
    })
}

function Right() {
    return Widget.Box({
        hpack: "end",
        spacing: 8,
        children: [
            // volumeIndicator(),
            NetworkIndicator(),
            Clock(),
            BatteryLabel(),
        ],
    })
}

const Bar = (monitor = 0) => Widget.Window({
    name: 'bar' + monitor,
    anchor: ['top', 'left', 'right'],
    monitor,
    exclusivity: "exclusive",
    child: Widget.CenterBox({
        start_widget: Left(monitor),
        center_widget: Center(),
        end_widget: Right(),
    }),
})

App.config({
    windows: [
        Bar(0), // can be instantiated for each monitor
        Bar(1),
    ],
})

export { }
