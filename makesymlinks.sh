#!/bin/sh

if [[ $* = "help" ]]; then
    echo "To use this script:
        ./makesymlinks [zsh|tmux]"

elif [[ $* =~ "zsh" ]]; then
    echo Symlinking zsh...
    
    for FILE in .zshrc .zsh_aliases .git-completion.zsh; 
    do 
        ln -sfv ~/dotfiles/$FILE ~/$FILE; 
    done
    
    # ~/.zsh_local is a real, untracked file for local config/secrets.
    # Seed it from the template only if it doesn't already exist.
    if [ ! -f ~/.zsh_local ]; then
        cp -v ~/dotfiles/.zsh_local.template ~/.zsh_local
    else
        echo "~/.zsh_local already exists, leaving it untouched"
    fi

elif [[ $* =~ "tmux" ]]; then
    echo Symlinking tmux config...
    ln -sfv ~/dotfiles/.tmux.conf ~/.tmux.conf ; 

else 
    echo "To use this script:
        ./makesymlinks [zsh|tmux]" 
fi
