# [Brightness](https://wiki.archlinux.org/index.php/backlight)

## [xbacklight](https://wiki.archlinux.org/index.php/backlight#xbacklight)

Does not work with radeon video cards.
Will complete this later.

## [brightnessctl](https://github.com/Hummer12007/brightnessctl)

### Installation

```sh
pacman -S brightnessctl
```

### Usage

For a full list of possibilities see `man brightnessctl`.

```sh
brightnessctl set 40%
brightnessctl set 5%+
brightnessctl set 5%-
```

### Mappings

The function keys matches `XF86MonBrightnessUp` and `XF86MonBrightnessDown`.
It's possible to bind them with any kind of key binder, example with i3:
```sh
bindsym XF86MonBrightnessUp exec --no-startup-id brightnessctl set 5%+
bindsym XF86MonBrightnessDown exec --no-startup-id brightnessctl set 5%-
```
