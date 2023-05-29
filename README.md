# spolybar

Spolybar is a set of scripts that enhances your Polybar experience by
integrating Spotify controls directly into your setup. Whether you're using
ncspot or the standard Spotify app via playerctl, Spolybar provides seamless,
music control and monitoring.

# Features

- The text appears horizontally scrolling. If neither ncspot or spotify are
  running, the text simply appears as "Spotify not running...".
- click-left: Previous track
- click-right: Next track
- click-middle: Play/Pause track

# Dependencies

- Required:
    - [polybar](https://github.com/polybar/polybar)
    - [jq](https://jqlang.github.io/jq/)

- One or both of:
    - [ncspot](https://github.com/hrkfdn/ncspot)
    - [playerctl](https://github.com/altdesktop/playerctl). You'd need spotify
      app as well with this.

# Structure

```
spolybar
├─ scripts
│  ├─ spolyfi_click_right.sh
│  ├─ spolyfi_click_left.sh
│  ├─ spolyfi.sh
│  └─ spolyfi_click_middle.sh
├─ README.md
├─ bar
│  └─ spolybar.ini
└─ modules
   └─ spolyfi.ini
```

# Usage

- Merge contents of `bar/spolybar.ini` to your polybar config where you place
  other bars (if you're doing a single file config).
- Merge contents of `modules/spolyfi.ini` to your polybar config where you place
  other modules (again only if you're single file config person).
- Copy `scripts/*.sh` wherever you want and ensure you're using the right path
  when invoking them but ensure to make all of them executable (`chmod +x
  script_name.sh`).

For reference here's my structure (other modules redacted):

```
polybar
├─ scripts
│  ├─ spolyfi_click_right.sh
│  ├─ spolyfi_click_left.sh
│  ├─ spolyfi.sh
│  ├─ spolyfi_click_middle.sh
├─ modules
│  ├─ spolyfi.ini
├─ config.ini
├─ spolybar.ini
├─ themes
│  └─ theme.ini
├─ launch.sh
```

Feel free to change the scripts as you see fit.

PS: If you're launching multiple bars, remember to launch spolybar as well like
so in your `launch.sh` script:

`polybar spolybar 2>&1 | tee -a /tmp/polybar.log & disown`

# Extra

You can use the scripts with `sxhkd` as well. For example, in your `sxhkdrc`:

```
# spotify
super + m
    $HOME/.config/ncspot.sh
ctrl + alt + j
    $HOME/.config/polybar/scripts/spolyfi_click_left.sh
ctrl + alt + k
    $HOME/.config/polybar/scripts/spolyfi_click_right.sh
ctrl + alt + p
    $HOME/.config/polybar/scripts/spolyfi_click_middle.sh
```
