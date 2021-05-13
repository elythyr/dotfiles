# OpenSSH

## Installation

```sh
sudo pacman -S openssh
```

## Configuration

### Firewall

We need to open the port 22:
```sh
sudo iptables -t filter -A INPUT -p TCP --dport 22 -j ACCEPT
sudo iptables -t filter -A OUTPUT -p TCP --sport 22 -j ACCEPT
```

### Start the server

To start the server on boot and right now:
```sh
sudo systemctl enable sshd.service
sudo systemctl start sshd.service
```

### SSH key

Generate a key:
```sh
ssh-keygen -t ed25519
```

You can now push it to a remote computer to avoid type the password every time:
```sh
ssh-copy-id -i ~/.ssh/id_ed25519.pub user@host
```
