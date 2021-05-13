# x2x

## Installation

This package is only available in the AUR:
```sh
sudo yay -S x2x
```

## Configuration

### Enable X Forwarding

Make sure to enable `X Forwarding` in your SSH configuration (not sure if it's on the host or remote, to check next time).
Edit the file `/etc/ssh/sshd_config` and uncomment the line `X11Forwarding yes`

### Potential issue with some login manager

Some login manager like gdm requires you to enable remote TCP connections to the X server.
Edit the file `/etc/gdm/gdm.confg-custom` and add `DisallowTCP=false` under the `[security]` section:
```ini
[security]

DisallowTCP=false
```

## Sharing mouse & keyboard

From the host machine, the one attached to the devices, run:
```sh
ssh -XC user@host x2x -east -o :0.0
```

This will open an SSH tunnel forwarding your keyboard & mouse to the other computer when you
move your mouse to the right of your host monitor (because of the `-east` option).
