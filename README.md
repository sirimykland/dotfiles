# Dotfiles

Git repo for my dotfiles, for distribution on all my Linux devices.


First you move the config file into the repo,
then symlinks can be made by 
ln -s .filename dotfiles/.filename

another way of creating multiple symlinks at once inside dotfiles dir :
for FILE in {.bashrc,.bash_aliases,.vimrc}; do ln -sfr `` `../$FILE` $FILE ; done 

