# Numock

## On bootup

Install `mkinitcpio-numlock` from the AUR:
```sh
yay -S mkinitcpio-numlock
```

Add the `numlock` hook before `encrypt` to be usable when decrypting a disk before booting it:
```
# /etc/mkinitcpio.conf
HOOKS([...] numlock [...] encrypt [...])
```

Then regenerate the initramfs:
```sh
sudo mkinitcpio -P
```

## On Xorg

### With LightDM

Install the `numlockx` pacakge:
```sh
yay -S numlockx
```

Edit the file `/etc/lightdm/lightdm.conf` to use it:
```sh
sed -i -e 's~^#\(greeter-setup-script\)=$~\1=/usr/bin/numlockx on~' /etc/lightdm/lightdm.conf
```
