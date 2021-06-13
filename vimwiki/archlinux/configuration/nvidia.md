# Nvidia

## Kernel Mode Setting (KMS)

This allow the kernel to set the mode of the video card to improve the rendering during bootup,
in TTYs and when switching from X to a TTys.

More information on: https://wiki.archlinux.org/title/Kernel_mode_setting

### Late KMS start (https://wiki.archlinux.org/title/NVIDIA#DRM_kernel_mode_setting)

This is the simplest solution, the early KMS start cover more use cases but require a bit more work.

Add nvidia DRM support by adding the kernel parameter `nvidia-drm.modeset=1`.

Edit the file `/etc/default/grub` and append the option to the line starting with `GRUB_CMDLINE_LINUX_DEFAULT=`, for instance:
```sh
# Before
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"

# After
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nvidia-drm.modeset=1"
```

Then re-generate the Grub configuration file with:
```sh
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

### Early KMS start

KMS is typically initialized after the initramfs stage. However it is possible to already enable KMS during the initramfs stage.
Add the modules `nvidia`, `nvidia_modeset`, `nvidia_uvm` and `nvidia_drm` to the initramfs:
```sh
# /etc/mkinitcpio.conf
MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
```

To take the EDID file into account it must also be added to the initramfs:
```sh
# /etc/mkinitcpio.conf
FILES=(/usr/lib/firmware/edid/1920x1080-acer-s243hl.bin)
```

To take the changes into account, run:
```sh
mkinitcpio -P
```

#### Pacman hook

To automatically add the modules whenever the Nvidia driver is updated we can use a pacman hook, create a file `/etc/pacman.d/hooks/nvidia.hook` with:
```sh
[Trigger]
Operation=Install
Operation=Upgrade
Operation=Remove
Type=Package
Target=nvidia
Target=linux
# Change the linux part above and in the Exec line if a different kernel is used

[Action]
Description=Update Nvidia module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'
```

## Fixing the terminal resolution (TTYs)

With the proprietary driver the startup terminal might be displayed at a lower resolution.

### For GRUB

Edit the `/etc/default/grub` file to match:
```sh
GRUB_GFXMODE=1920x1080x32,1280x1024x24,auto
GRUB_GFXPAYLOAD_LINUX=keep
```
