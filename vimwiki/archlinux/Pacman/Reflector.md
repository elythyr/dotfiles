# [Reflector](https://wiki.archlinux.org/index.php/Reflector)

## Installation

```sh
pacman -S reflector
```

## Manual run

Select the 200 most recently synchronized HTTP or HTTPS mirrors, sort them by download speed, and overwrite the file /etc/pacman.d/mirrorlist:
```sh
cp /etc/pacman.d/mirrorlist /tmp/mirrorlist.bak
reflector --country FR --country DE --country GB --country CH --latest 200 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

## Automation

See [ArchLinuw - Reflector - Automation](https://wiki.archlinux.org/index.php/Reflector#Automation)
