#!/bin/sh

for FILE in .bashrc .bash_aliases .vimrc .vim; 
do 
    ln -sfv ~/dotfiles/$FILE ~/$FILE ; 
done

