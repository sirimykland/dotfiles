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
    
    ln -sv ~/dotfiles/.zsh_local ~/.zsh_local; 
    git update-index --skip-worktree .zsh_local;

elif [[ $* =~ "tmux" ]]; then
    echo Symlinking tmux config...
    ln -sfv ~/dotfiles/.tmux.conf ~/.tmux.conf ; 

else 
    echo "To use this script:
        ./makesymlinks [zsh|tmux]" 
fi
