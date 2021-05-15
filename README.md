# Dotfiles

Yet another dotiles repository ;)
I wanted to gave a try to [rcm](https://github.com/thoughtbot/rcm).

## Setting it up

Install `rcm` which is in the AUR:
```sh
yay -S rcm-git
```

Clone this repository:
```sh
# Clone and initialize all submodules
git clone git@github.com:camilledejoye/dotfiles -b rcm --recurse .dotfiles

# Or select only some, for instance I don't need fzf submodule on Arch
git clone git@github.com:camilledejoye/dotfiles \
  -b rcm \
  --recurse-submodules=oh-my-zsh \
  --recurse-submodules=zsh/oh-my-zsh/plugins/zsh-autosuggestions \
  --recurse-submodules=zsh/oh-my-zsh/plugins/zsh-syntax-highlighting \
  --recurse-submodules=zsh/oh-my-zsh/plugins/zsh-vim-mode \
  .dotfiles
```

Deploy the dotiles onto the host:
```sh
# Force overwrite, perfect for a first install
rcup -f
```

Install Neovim plugins:
```
v -c PackInstall
```
