# Dotfiles

Git repo for my dotfiles, easy setup on new devices.

## How to get this up and running

```
git clone https://github.com/sirimykland/dotfiles.git ~/dotfiles
cd ~/dotfiles
```


## Symlink files

The script symlinks config into `$HOME`, backing up any existing files first.
It works regardless of where the repo is cloned.

```
# zsh config (also seeds ~/.zsh_local from the template on first run)
./makesymlinks.sh zsh

# tmux config
./makesymlinks.sh tmux
```

Requires [oh-my-zsh](https://ohmyz.sh/) for the zsh setup.

## Local config/aliases

use `~/.zsh_local` for local configurations, aliases or secrets.
It is git-ignored and seeded from `.zsh_local.template`, so it is never tracked.
