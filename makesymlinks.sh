#!/usr/bin/env bash

set -e

# Directory this script lives in (the dotfiles repo), resolved no matter where
# it is run from or what the repo is cloned as (~/dotfiles, ~/.dotfiles, ...).
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Download git completion scripts from the official Git repository.
download_git_completion() {
    local url_base="https://raw.githubusercontent.com/git/git/master/contrib/completion"
    local file="git-completion.zsh"
    local dest="$DOTFILES_DIR/$file"

    echo "Downloading $file from git/git repo..."
    if curl -fsSL -o "$dest" "$url_base/$file"; then
        echo "✓ Downloaded $dest"
    else
        echo "✗ Failed to download $file" >&2
        return 1
    fi
}

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
        ./makesymlinks.sh [zsh|tmux|git]"

elif [[ $* =~ "zsh" ]]; then
    echo Symlinking zsh...

    # Download git completion if it doesn't exist
    if [ ! -f "$DOTFILES_DIR/git-completion.zsh" ]; then
        download_git_completion
    fi

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

elif [[ $* =~ "git" ]]; then
    echo Updating git completion scripts...
    download_git_completion

else
    echo "To use this script:
        ./makesymlinks.sh [zsh|tmux|git]"
fi
