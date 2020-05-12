# Pacman

## Configuraiton

### Add colors

Uncomment `# Color` in `/etc/pacman.conf`


## Usage

### Install a package

```sh
sudo pacman -S <packages...>
```

### Remove a package

Remove a package and dependencies which are not requried anymore:
```sh
sudo pacman -Rsu <package>
```

### Upgrade

Upgrade all packages:
```sh
sudo pacman -Syu
```
