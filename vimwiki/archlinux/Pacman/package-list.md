# Package list

The goal is to generate the list of packages manually installed on a system.
This way it's possible to know what to install the next time.

Put all packages installed manually in a file:
```sh
pacman -Qqe > packages.list
```

But there is also the AUR packages in that list, which pacman won't know how to handle.
So we need to filter them before asking pacman to install:
```sh
pacman  -S --needed $(comm -12 <(pacman -Slq | sort) <(sort packages.list))
```
