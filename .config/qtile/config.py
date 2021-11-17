import os
from pathlib import Path
import subprocess
from typing import List, Optional  # noqa: F401

from libqtile.backend.base import Window
from libqtile.layout.base import Layout
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"  # Super keyboard key
alt = "mod1"
HOME = str(Path.home())
terminal = guess_terminal()
last_playing = "spotify"
SPACE = 12

def playpause(qtile):
    global last_playing
    if qtile.widgetMap['clementine'].is_playing() or last_playing == 'clementine':
        qtile.cmd_spawn("clementine --play-pause")
        last_playing = 'clementine'
    if qtile.widgetMap['spotify'].is_playing or last_playing == 'spotify':
        qtile.cmd_spawn("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause")
        last_playing = 'spotify'

def next_prev(state):
    def f(qtile):
        if qtile.widgetMap['clementine'].is_playing():
            qtile.cmd_spawn("clementine --%s" % state)
        if qtile.widgetMap['spotify'].is_playing:
            cmd = "Next" if state == "next" else "Previous"
            qtile.cmd_spawn("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.%s" % cmd)
    return f

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle floating
    Key([mod], "g", lazy.window.toggle_floating()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    # System manager
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    
    # Custom shortcuts

    # Toggle floating
    Key([alt], "d", lazy.spawn("rofi -show drun -show-icons"),
        desc="Spawn a command using a prompt widget"),
    Key([alt], "Tab", lazy.spawn("rofi -show window -show-icons"),
        desc="Spawn a command using a prompt widget"),
    Key([mod], "f", lazy.spawn("pcmanfm"),
        desc="Spawn a command using a prompt widget"),
    Key([mod], "p", lazy.spawn(f"{HOME}/.local/share/rofi/monitor_layout.sh"),
        desc="Spawn a command using a prompt widget"),

    # Sound
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -c 0 sset Master 1- unmute")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -c 0 sset Master 1+ unmute"))
    
    # # Volume
    # Key([], "XF86AudioLowerVolume", lazy.spawn(
    #     "pactl set-sink-volume @DEFAULT_SINK@ -5%"
    # )),
    # Key([], "XF86AudioRaiseVolume", lazy.spawn(
    #     "pactl set-sink-volume @DEFAULT_SINK@ +5%"
    # )),
    # Key([], "XF86AudioMute", lazy.spawn(
    #     "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    # )),

    # # Brightness
    # Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    # Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
]

__groups = {
    1: Group("", layout='monadtall', matches=[Match(wm_class=["brave"])]),
    2: Group("", layout='monadtall', matches=[Match(wm_class=["Alacritty"])]),
    3: Group("", layout='monadtall', matches=[Match(wm_class=["vim", "vscodium", "vscode"])]),
    4: Group("", layout='floating', matches=[Match(wm_class=["mailspring", "telegram-desktop", "typora"])]),
    5: Group("", layout='floating', matches=[Match(wm_class=[])]),
    6: Group("", layout="floating", matches=[Match(wm_class=["Spotify"])]),
}

groups = [__groups[i] for i in __groups]

def get_group_key(name):
    return[k for k, g in __groups.items() if g.name == name][0]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], str(get_group_key(i.name)), lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], str(get_group_key(i.name)), lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

### Layouts
layout_theme = {
    "border_width": 4,
    "margin": 8,
    "border_focus": "#098758",
    # "border_normal": "#098758"
}


layouts = [
    layout.Columns(border_focus_stack=['#098758', '#098758'], border_width=4),
    layout.Max(),
    layout.Floating(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    layout.MonadTall(**layout_theme),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

colors = [["#282c34", "#282c34"], # panel background
          ["#3d3f4b", "#434758"], # background for current screen tab
          ["#ffffff", "#ffffff"], # font color for group names
          ["#ff5555", "#ff5555"], # border line color for current tab
          ["#74438f", "#74438f"], # border line color for 'other tabs' and color for 'odd widgets'
          ["#4f76c7", "#4f76c7"], # color for the 'even widgets'
          ["#e1acff", "#e1acff"], # window name
          ["#ecbbfb", "#ecbbfb"]] # backbround for inactive screens


widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    fontsize=25,
                ),
                # widget.Prompt(),
                widget.WindowName(
                    font="Inconsolata",
                    fontsize=20,
                ),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
               
                widget.Mpris2(
                    name="spotify",
                    objname="org.mpris.MediaPlayer2.spotify",
                    display_metadata=['xesam:title', 'xesam:artist'],
                    scroll_chars=None,
                    stop_pause_text='',
                    **widget_defaults
                ),
                widget.Spacer(length=SPACE),
                widget.TextBox(
                    text="",
                    background = colors[2],
                    foreground = colors[5],
                    padding = 0,
                    fontsize = 20
                ),
                widget.Net(
                    font="Inconsolata",
                    fontsize=20,
                    interface="wlp62s0",
                    format='{down} ↓↑ {up}',
                    foreground=colors[2],
                    background=colors[5],
                    padding=5
                ),
                widget.TextBox(
                    text="",
                    foreground=colors[2],
                    background=colors[4],
                    padding=0,
                    fontsize=20
                ),
                widget.Memory(
                    font="Inconsolata",
                    fontsize=20,
                    foreground=colors[2],
                    background=colors[4],
                    format="Mem:{MemUsed: 0.1f} {mm}",
                    measure_mem="G",
                    update_interval=2.0,
                    mouse_callbacks={'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e htop')},
                    padding=5,
                ),
                widget.Spacer(length=SPACE),
                widget.BatteryIcon(
                    # theme_path="/home/nachoaz/.config/qtile/qtile-icons",
                ),
                widget.Battery(
                    format = "{char} {percent:2.0%}",
                    update_interval = 5,
                    low_percentage = 0.10,
                    unknown_char = "",
                    full_char = "",
                    charge_char = "+",
                    discharge_char = "",
                    empty_char = ""
                ),
                widget.Spacer(length=SPACE),
                widget.TextBox(
                    text = "",
                    foreground = colors[2],
                    background = colors[5],
                    padding = 0,
                    fontsize = 20
                ),
                widget.Clock(
                    font="Inconsolata",
                    fontsize=20,
                    foreground = colors[2],
                    background = colors[5],
                    format='%Y-%m-%d %a %H:%M'
                ),

                widget.Spacer(length=SPACE),
                widget.CurrentLayoutIcon(scale=0.65),
                # widget.CurrentLayout(
                #     font="Inconsolata",
                #     fontsize=15,
                # ),
                widget.Systray(
                    background = colors[0],
                    padding = 5
                ),
                # widget.QuickExit(
                #     fontsize=20,
                #     default_text=""
                # ),
                widget.Spacer(length=SPACE),
            ],
            30,
        ),
    ),
]

# Drag floating layouts.
# mouse = [
#     Drag([mod], "Button1", lazy.window.set_position_floating(),
#          start=lazy.window.get_position()),
#     Drag([mod], "Button3", lazy.window.set_size_floating(),
#          start=lazy.window.get_size()),
#     Click([mod], "Button2", lazy.window.bring_to_front())
# ]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.Popen([home + '/.config/qtile/autostart.sh'])




from libqtile.command import lazy as lazy_mouse
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy_mouse.window.set_position_floating(),
        start=lazy_mouse.window.get_position()
    ),
    Drag(
        [alt],
        "Button1",
        lazy_mouse.window.set_size_floating(),
        start=lazy_mouse.window.get_size()
    ),
    Click([mod], "Button2", lazy_mouse.window.bring_to_front())
]
