#!/bin/sh

for FILE in .bashrc .bash_aliases .bash_local .vimrc .vim; 
do 
    ln -sfv ~/dotfiles/$FILE ~/$FILE ; 
done

