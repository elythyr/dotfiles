# Arch Linux - Configuration

## .profile

This file will be loaded when starting X and a tty, that's where the env variables goes:
```sh
# ~/.profile

export EDITOR=nvim
export TERMINAL=alacritty
export BROWSER=firefox
```

## Key bindings

### Install

```sh
yay -S xbindkeys
```

### Configure

```sh
xbindkeys --defaults > ~/.xbindkeysrc
```

Will generate a default configuration file to use as template.  
Comment the default mappings until needed.

### Make it permanent

```sh
# ~/.profile

# Load the key bindings defined in ~/.xbindkeysrc
xbindkeys
```
