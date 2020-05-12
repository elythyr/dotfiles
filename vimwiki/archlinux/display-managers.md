# Display Managers

## LightDM

## Installation

```sh
pacman -S lightdm lightdm-gtk-greeter
```


## Enable the service

In order for LightDM to start automatically the service must be enabled.
It might already be done, no harm making sure though:
```sh
systemctl enable lightdm.service
```
