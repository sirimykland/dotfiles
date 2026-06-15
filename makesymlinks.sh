#!/usr/bin/env bash

set -e

# Directory this script lives in (the dotfiles repo), resolved no matter where
# it is run from or what the repo is cloned as (~/dotfiles, ~/.dotfiles, ...).
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Symlink a repo file into $HOME, backing up any existing file/symlink first.
link_file() {
    local src="$DOTFILES_DIR/$1"
    local dest="$HOME/$1"

    if [ "$(readlink "$dest" 2>/dev/null)" = "$src" ]; then
        echo "$dest already linked"
        return
    fi

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        local backup="$dest.backup.$(date +%Y%m%d%H%M%S)"
        mv "$dest" "$backup"
        echo "Backed up $dest -> $backup"
    fi

    ln -sv "$src" "$dest"
}

if [[ $* = "help" ]]; then
    echo "To use this script:
        ./makesymlinks.sh [zsh|tmux]"

elif [[ $* =~ "zsh" ]]; then
    echo Symlinking zsh...

    for FILE in .zshrc .zsh_aliases .git-completion.zsh; do
        link_file "$FILE"
    done

    # ~/.zsh_local is a real, untracked file for local config/secrets.
    # Seed it from the template only if it doesn't already exist.
    if [ ! -f ~/.zsh_local ]; then
        cp -v "$DOTFILES_DIR/.zsh_local.template" ~/.zsh_local
    else
        echo "~/.zsh_local already exists, leaving it untouched"
    fi

elif [[ $* =~ "tmux" ]]; then
    echo Symlinking tmux config...
    link_file ".tmux.conf"

else
    echo "To use this script:
        ./makesymlinks.sh [zsh|tmux]"
fi
