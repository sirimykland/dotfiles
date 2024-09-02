#!/bin/sh

if [[ $* = "help" ]]; then
    echo "To use this script:
        ./makesymlinks [zsh|bash|tmux|git|other]"

elif [[ $* =~ "zsh" ]]; then
    echo Symlinking zsh...
    
    for FILE in .zshrc .zsh_aliases .git-completion.zsh; 
    do 
        ln -sfv ~/dotfiles/$FILE ~/$FILE; 
    done
    
    ln -sv ~/dotfiles/.zsh_local ~/.zsh_local; 
    git update-index --skip-worktree .zsh_local;

elif [[ $* =~ "bash" ]]; then
    echo Symlinking bash...
    for FILE in .bashrc .bash_aliases .git-completion.bash; 
    do 
        ln -sfv ~/dotfiles/$FILE ~/$FILE ; 
    done
    ln -sv ~/dotfiles/.bash_local ~/.bash_local; 
    git update-index --skip-worktree .bash_local;

elif [[ $* =~ "tmux" ]]; then
    echo Symlinking tmux config...
    ln -sfv ~/dotfiles/.tmux.conf ~/.tmux.conf ; 

elif [[ $1 =~ "other" ]]; then
    echo Symlinking other files...
    for FILE in .vimrc .vim; 
    do 
        ln -sfv ~/dotfiles/$FILE ~/$FILE; 
    done

else 
    echo "To use this script:
        ./makesymlinks [zsh|bash|other]" 
fi
