from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile import bar, layout, widget, hook
from libqtile.lazy import lazy
import os, subprocess



mod = "mod4"
gruv = "9a8a7a"
alacritty = "alacritty"
rofi = "rofi -show drun"
screenshot = f"bash -c 'shotgun -f png -g $(hacksaw -g 2 -s 2 -c {gruv}) - | tee $HOME/Screenshots/screenshot-$(date +%Y-%m-%d-%H-%M-%S).png | xclip -t \"image/png\" -selection clipboard'"

keys = [
    Key([mod], "p", lazy.spawn(rofi)),
    Key([mod], "Return", lazy.spawn(alacritty)),
    Key([], "Print", lazy.spawn(screenshot)),

    Key([mod], "m", lazy.window.toggle_minimize()),
    Key([mod], "w", lazy.window.kill()),
    Key([mod, "control"], "q", lazy.shutdown()),
    Key([mod, "control"], "r", lazy.reload_config()),
]

groups = [Group(i) for i in "123456"]
for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
            )
        ]
    )

layouts = [
    layout.MonadTall(
        margin=20,
        border_width=4,
        border_normal=gruv,
        border_focus=gruv
    )
]

screens = [
    Screen(
        top=bar.Gap(20),
        right=bar.Gap(20),
        left=bar.Gap(20),
        bottom=bar.Gap(20)
    ),
]

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wmname = "qtile"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.Popen([home + '/.config/qtile/autostart.sh'])
