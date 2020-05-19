# Dunst

Lightweight notification-deamon.

## Installation

```sh
pacman -S dunst
```

Start dunst in your autostart script with:
```sh
/usr/bin/dunst
```

## Configuration

A default configuration can be found in `/usr/share/dunst/dunstrc`:
```sh
cp /usr/share/dunst/dunstrc ~/.config/dunst/dunstrc
```

### Icons

By default dunst will use the gnome icons, you can choose any other theme in the
configuration file by modifying the `icon_paht` option.  
You can install gnome icons with:
```sh
pacman -S gnome-icon-theme
```
