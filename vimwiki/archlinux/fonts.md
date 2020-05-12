# Fonts

## Prerequisites

The `jq` is required to deal with the JSON responses of the GitHub API.
```sh
pacman -S jq
```

## Nerd Fonts

### List all the fonts

Put the result into a file to avoid unnecessary requests:
```sh
curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest > /tmp/nerd-fonts.json
```

### List fonts by download count

```sh
curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest \
    | jq -r '.assets | sort_by(.download_count)[] | "\(.download_count) \(.name)"'
```

```sh
jq -r '.assets | sort_by(.download_count)[] | "\(.download_count) \(.name)"' /tmp/nerd-fonts.json
```

### Find a font information by name

```sh
curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest \
    | jq '.assets[] | select(.name | contains("UbuntuMono"))"'
```

```sh
jq '.assets[] | select(.name | contains("UbuntuMono"))"' /tmp/nerd-fonts.json
```

### Install a font familly

Use the script `~/.local/bin/install-font`.
