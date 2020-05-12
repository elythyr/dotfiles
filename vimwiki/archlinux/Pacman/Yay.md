# Yay

## Prerequisites

Many packages from the `base-devel` are needed to run `makepkg`, install them all:
```sh
pacman -S base-devel
```

## Installation

```sh
git clone https://aur.archlinux.org/yay.git && $(cd yay; makepkg -si) && rm -fr yay
```
