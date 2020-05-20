# [UDisks](https://wiki.archlinux.org/index.php/Udisks)

[UDisks](http://www.freedesktop.org/wiki/Software/udisks/) provides a daemon `udisksd`, that implements D-Bus interfaces used to query and manipulate storage devices, and a command-line tool `udisksctl`, used to query and use the daemon

For a better experience with NTFS file systems it's recommended to also install `ntfs-3g`:

## Installation

```sh
pacman -S udisks ntfs-3g
```

## Usage

No real reasons to use it directly, USB devices will be automatically mounted and the dotfiles provide a `udis-menu` utility to mount/unmount them easly.

# [Udiskie](https://github.com/coldfix/udiskie)

It's a font-end for `udisks` that allows to manage removable media and auto mount them.  
Here it's only used to mount USB drives automatically when plugged in.

```sh
pacman -S udiskie
```

## Usage

Start the daemon in you autostart script:
```sh
# ~/.local/bin/startup

# Start the daemon to auto mount USB drives
udiskie &
```
