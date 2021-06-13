# [UDisks](https://wiki.archlinux.org/index.php/Udisks)

[UDisks](http://www.freedesktop.org/wiki/Software/udisks/) provides a daemon `udisksd`, that implements D-Bus interfaces used to query and manipulate storage devices, and a command-line tool `udisksctl`, used to query and use the daemon

For a better experience with NTFS file systems it's recommended to also install `ntfs-3g`:

## Installation

```sh
pacman -S udisks ntfs-3g
```

## Usage

No real reasons to use it directly, USB devices will be automatically mounted and the dotfiles provide a `udis-menu` utility to mount/unmount them easily.

# [Udiskie](https://github.com/coldfix/udiskie)

It's a font-end for `udisks` that allows to manage removable media and auto mount them.  
Here it's only used to mount USB drives automatically when plugged in.

```sh
pacman -S udiskie
```

## Configure Polkit permissions

Create the file `/etc/polkit-1/rules.d/50-udiskie.rules` with permissions `644` and the following content:
```
polkit.addRule(function(action, subject) {
  var YES = polkit.Result.YES;
  // NOTE: there must be a comma at the end of each line except for the last:
  var permission = {
    // required for udisks1:
    "org.freedesktop.udisks.filesystem-mount": YES,
    "org.freedesktop.udisks.luks-unlock": YES,
    "org.freedesktop.udisks.drive-eject": YES,
    "org.freedesktop.udisks.drive-detach": YES,
    // required for udisks2:
    "org.freedesktop.udisks2.filesystem-mount": YES,
    "org.freedesktop.udisks2.encrypted-unlock": YES,
    "org.freedesktop.udisks2.eject-media": YES,
    "org.freedesktop.udisks2.power-off-drive": YES,
    // required for udisks2 if using udiskie from another seat (e.g. systemd):
    "org.freedesktop.udisks2.filesystem-mount-other-seat": YES,
    "org.freedesktop.udisks2.filesystem-unmount-others": YES,
    "org.freedesktop.udisks2.encrypted-unlock-other-seat": YES,
    "org.freedesktop.udisks2.eject-media-other-seat": YES,
    "org.freedesktop.udisks2.power-off-drive-other-seat": YES
  };
  if (subject.isInGroup("storage")) {
    return permission[action.id];
  }
});
```

## Usage

Start the daemon in you autostart script:
```sh
# ~/.local/bin/startup

# Start the daemon to auto mount USB drives
udiskie --smart-tray &
```
