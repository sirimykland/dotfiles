# Dotfiles

Git repo for my dotfiles, for distribution to all my Linux devices.

## How to get this up and running

> git clone https://github.com/sirimykland/dotfiles.git
> cd dotfiles/


## Symlink files

all files:
> ./makesymlinks.sh  

or single file
> ln -s .filename dotfiles/.filename

## Local config/aliases

create a `.bash_local` for local configurations or aliases
the file is listed in `.gitignore`
