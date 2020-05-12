# [Netword Manager](https://wiki.archlinux.org/index.php/NetworkManager)

# Installation

```sh
pacman -S networkmanager network-manager-applet
```

## Enabling the deamon

```sh
systemctl enable NetworkManager
```

## Starting nm-applet on login

### i3

```sh
# ~/.config/i3/config

exec --no-startup-id nm-applet
```

## Usage

List accessible wifi networks:
```sh
nmcli device wifi list
```

Connect to a network
```sh
nmcli device wifi connect <SSID> password <PASSWORD>
```

List interfaces:
```sh
nmcli device
```

Disconnect an interface
```sh
nmcli device disconnect <INTERFACE>
```
