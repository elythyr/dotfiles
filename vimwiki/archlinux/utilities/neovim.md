# Neovim

## Installation

For the stable release:
```sh
pacman -S neovim
```

For the nightly builds:
```sh
yay -S neovim-nightly
```

## Providers

### Python

Python 2 is deprecated, the package `python2-pynvim` has some missing dependencies
and can't be installed anymore.
I'll try without it and if something seems broken I might try installing it with `pip` directly.

For Python 3
```sh
pacman -S python-pynvim
```

### Node.js

This will be required by CoC, to enable it:
```sh
pacman -S nodejs yarn

# To install the provider
yarn global add neovim
```

## Clipboard

To be able to copy/paste from the X11 clipboard:
```sh
pacman -S xclip
```
