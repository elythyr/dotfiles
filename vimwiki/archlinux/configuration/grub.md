# Grub

## Brackground images

Update `/etc/default/grub` like the following:
```sh
# adapt the path to the image
GRUB_BACKGROUND="/boot/grub/backgrounds/arch-logo.png"
```

Don't forget to rebuild the configuration afterward:
```sh
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
