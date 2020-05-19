# Docker

## Installation

```sh
pacman -S docker
```

Start and enable docker service:
```sh
systemctl enable --now docker
```

To run docker commands as non root:
```sh
usermod -aG docker $USER
```

You'll need to logout and log back in for this to take effect.
