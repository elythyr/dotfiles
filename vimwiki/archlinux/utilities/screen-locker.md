# Screen locker

## [sflock](https://github.com/benruijl/sflock)

Simple screen locker for X that prevent using TTYs too.

### Installation

```sh
yay -S sflock-git
```

### Usage

`sflock` depends on the `ttf-dejavu` package being installed to work without you specifying a font.

To lock the screen simply start:
```sh
sflock
```

You can find out which fonts are available to X with:
```sh
# If xlsfonts is not yet installed
pacman -S xorg-xlsfonts

# List the fonts
xlsfonts
```

Then simply copy/paste one the result.
For example to use Hack font with an 8 point size:
```sh
sflock -f -misc-hack-medium-r-normal--0-80-0-0-m-0-iso8859-1
```

## xss-lock

Hooks up an external locker to [DPMS](https://wiki.archlinux.org/index.php/Display_Power_Management_Signaling) and [systemd](https://wiki.archlinux.org/index.php/Systemd) events.

### Installation

```sh
pacman -S xss-lock
```

### Usage

Start `xss-lock` in your startup script by providing it the command of the locker to use:
```sh
# ~/.local/bin/startup

# Start xss-lock to handle the lock screen
pgrep -x xss-lock >/dev/null 2>&1 || xss-lock -q -- sflock -f -misc-hack-medium-r-normal--0-800-0-0-m-0-iso8859-1 -b 'You shall not pass!' -h &
```
