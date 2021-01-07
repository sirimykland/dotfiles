#!/bin/sh

for FILE in .bashrc .bash_aliases .bash_local .vimrc .vim .git-completion.bash; 
do 
    ln -sfv ~/dotfiles/$FILE ~/$FILE ; 
done

