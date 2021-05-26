# Pass

Simple password store.

## Installation

```sh
pacman -S pass
```

## Initialize or add a new key

```sh
pass init {KEY}
```

## GPG keys managements

### Exporting keys

```sh
gpg --export {KEY} > public.key
gpg --export-secret-keys {key} > private.key
```

### Importing keys

```sh
gpg --import public.key private.key
gpg --edit-key {KEY} trust quit
```
