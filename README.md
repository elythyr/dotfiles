# .dotfiles

Yet another dotiles repository ;)

## Installation

Clone as a bare repository, the destination must not be changed:
```sh
git clone --bare git@github.com:elythyr/dotfiles.git ~/.dotfiles
```

Declare an alias to help to manipulate the repository:
```sh
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
```

Checkout the files in the home directory, **use the bare branch**:
```sh
cd
dotfiles checkout bare
```

In case of errors caused by the override of some files just move them and deal with conflicts later:
```sh
mv conflicting-file conflicting-file.bak
diff conflicting-file conflicting-file.bak
```

Ingore untracked files, so the status won't be polluted:
```sh
dotfiles config status.showUntrackedFiles no
```
