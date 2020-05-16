# [Feh](https://wiki.archlinux.org/index.php/Feh)

Lightweight image viewer that can also manage wallpapers.

## Installation

```sh
pacman -S feh
```

## Usage

To have a random wallpaper for each new session add this line to your startup script:
```sh
feh --no-fehbg --recursive --randomize --bg-scale ~/Pictures/Wallpapers
```
