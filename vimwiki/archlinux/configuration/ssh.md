# SSH

## Installation

Install the package:
```sh
sudo pacman -S openssh
```

Enable the service:
```sh
sudo systemctl enable sshd
```

## SSH agent

To remember the SSH keys and provide them automatically.

We need to run the deamon for it work.
It's possible to use systemd to start it automatically.

Create the service:
```ini
; ~/.config/systemd/user/ssh-agent.service
[Unit]
Description=SSH key agent

[Service]
Type=simple
Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket
# DISPLAY required for ssh-askpass to work
Environment=DISPLAY=:0
ExecStart=/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK

[Install]
WantedBy=default.target
```

Export the necessary environment when initializing a login shell:
```sh
# ~/.dotfiles/shell/login
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
```

Enable and start the service:
```sh
systemctl --users enable ssh-agent.service
systemctl --users start ssh-agent.service
```
