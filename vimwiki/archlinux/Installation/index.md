# Arch Linux - Installation

This is a more a cheat sheet than a tutorial, for more information check the [ArchWiki](https://wiki.archlinux.org/index.php/installation_guide).


## Pre-installation

### Set the keyboard layout

To install with an AZERTY keyboard, it's a temporary fix:
```sh
loadkeys fr
```


### Verify the boot mode

Check if the UEFI is activated on the motherboard:
```sh
ls /sys/firmware/efi/efivars
```

In case of result, check the [ArchWiki](https://wiki.archlinux.org/index.php/installation_guide) to be sure to not make a mistake.


### Connect to internet

Check that the network interface is recognize
```sh
ip link
```

#### Connect to the wifi

A helpful utility is provided to connect to a wifi network easily:
```sh
wifi-menu
```


### Update the clock

```sh
timedatectl set-ntp true
```


### Partition the disks

There is more layout examples on the [ArchWiki](https://wiki.archlinux.org/index.php/Partitioning#Example_layouts).
And more details about how to [choose between MBR and GPT](https://wiki.archlinux.org/index.php/Partitioning#Choosing_between_GPT_and_MBR).

#### BIOS/MBR

The usual organization looks like:

| Mount point | Partition | Partition type | Boot flag | Recommended size |
|-------------|-----------|----------------|-----------|------------------|
| /           | /dev/sdX1 | Linux          | Yes       | 23 GiB - 32 GiB  |
| /home       | /dev/sdX2 | Linux          | No        | Rest of the disk |
| [SWAP]      | /dev/sdX3 | Linux swap     | No        | 2 GiB            |

Use either `fdisk` or `cfdisk` to have a visual interface.

#### UEFI

The usual organization looks like:

| Momunt point | Partition | Partition type                                               | gdisk's code     | Recommended size |
|--------------|-----------|--------------------------------------------------------------|------------------|------------------|
| /boot/efi    | /dev/sdX1 | `C12A7328-F81F-11D2-BA4B-00A0C93EC93B` EFI system partition  | ef00             | At least 260 MiB |
| /            | /dev/sdX2 | `4F68BCE3-E8CD-4DB1-96E7-FBCAF984B709` Linux x86-64 root (/) | 8304             | 23 GiB - 32 GiB  |
| /home        | /dev/sdX3 | `933AC7E1-2EB4-4F13-B844-0E14E2AEF915` Linux /home           | 8302             | Rest of the disk |
| [SWAP]       | /dev/sdX4 | `0657FD6D-A4AB-43C4-84E5-0933C84B4F4F` Linux SWAP            | 8200             | 2 GiB            |

Use either gdisk or cgdisk to have a visual interface.


### Format the partitions

The UEFI partition must be in FAT:
```sh
mkfs.fat -F32 /dev/sdX1
```

The root and home partitions are usually formated in `ext4`:
```sh
mkfs.ext4 /dev/sdX2
mkfs.ext4 /dev/sdX3
```

Prepare the swap partition:
```sh
mkswap /dev/sdX4
swapon /dev/sdX4
```


### Mount the file system

We need to mount our new file system in order to install Arch on it:
```sh
mount /dev/sdX2 /mnt
mkdir /mnt/boot /mnt/home
mount /dev/sdX1 /mnt/boot
mount /dev/sdX3 /mnt/home
```


### Generate an fstab file

```sh
genfstab -U /mnt >> /mnt/etc/fstab
```


## Installation

### Select the mirrors

Configuring the mirrors list right now can save a lot of time for the installation process.
You can install [Reflector](../Pacman/Reflector) to do it automatically.


### Install essential packages

Install the essential packages to have a working system:
```sh
pacstrap /mnt base linux linux-firmware man-pages man-db sed which mlocate vim networkmanager network-manager-applet xorg-server xorg-setxkbmap xorg-xev xorg-xprop zsh
```


## Configuring the system

### Switching to the newly installed system

Until now we were not in our system, let's switch to it:
```sh
arch-chroot /mnt
```


### Setting the time zone

Define the correct time zone:
```sh
ln -sf /usr/share/zoneinfo/Europ/Paris /etc/localtime
```

Update the hardware clock:
```sh
hwclock --systohc
```


### Localization

Uncomment the desired locale in `/etc/locale.gen`: `en_US.UTF-8` and `fr_FR.UTF-8`, then generate the locales:
```sh
locale-gen
```

Create the `locale.conf` file:
```sh
# /etc/locale.conf
LANG=fr_FR.UTF-8
LC_MESSAGES=en_US.UTF-8
```

`LANG` will define the values of all `LC_*` variables, while we override `LC_MESSAGES` in order to have the system messages in english.

Make the keyboard layout persistent for the TTYs:
```sh
echo 'KEYMAP=fr-latin1' > /etc/vconsole.conf
```

`fr-latin1` to get the `²` key working.

Configure the keyboard layout for Xorg, generate the configuration file `/etc/X11/xorg.conf/00-keyboard.conf`:
```sh
localectl --no-convert set-x11-keymap fr oss "" terminate:ctrl_alt_bksp,grp:rctrl_rshift_toggle,caps:escape
```

INFO: Could not run it during the install, will have to do it in the configuration after the reboot I guess.
It's because Xorg server was not started yet, try to start it manually next time.


### Network Configuration

Configure the hostname for your machine:
```sh
echo 'myhostname' > /etc/hostname
```

Add matching entries to `hosts`:
```sh
# /etc/hosts

127.0.0.1	localhost
::1         localhost
127.0.1.1   myhostname.local myhostname
```


### Set the root password

```sh
passwd
```


### Boot loader

#### BIOS/MBR

```sh
pacman -S grub
grub-install /dev/sdX
grub-mkconfig -o /boot/grub/grub.cfg
```

#### UEFI

```sh
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```


### Create user

```sh
useradd -mG wheel cdejoye
passwd cdejoye
```

#### Grant sudo access to the user

##### Using `sudoers.d`

Make sure `sudo` is installed first.
Add a file named as the user with the content:
```sh
echo "cdejoye ALL=(ALL) ALL" > "/etc/sudoers.d/cdejoye"
```

##### Using the `wheel` group

* Edit the sudo file `EDITOR=vim visudo`
* Uncomment `# %wheel ALL=(ALL) ALL`


### Reboot

Exit the chroot with `Ctrl+d` or by typing `exit`.
Unmount to ensure there is no busy resource:
```sh
umount -R /mnt
```

Then reboot:
```sh
reboot
```
