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
# zsh config (downloads git completion on first run, seeds ~/.zsh_local from template)
./makesymlinks.sh zsh

# tmux config
./makesymlinks.sh tmux

# Update git completion scripts from the official git repository
./makesymlinks.sh git
```

Requires [oh-my-zsh](https://ohmyz.sh/) for the zsh setup.

**Note:** Git completion scripts are downloaded from the [official Git repository](https://github.com/git/git/tree/master/contrib/completion) on first setup and can be updated anytime with `./makesymlinks.sh git`.

## Local config/aliases

use `~/.zsh_local` for local configurations, aliases or secrets.
It is git-ignored and seeded from `.zsh_local.template`, so it is never tracked.
