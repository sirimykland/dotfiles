# Dotfiles

Git repo for my dotfiles, for distribution on all my Linux devices.


First you move the config file into the repo,
then symlinks can be made by 
ln -s .filename dotfiles/.filename

another way of creating multiple symlinks at once inside homefolder:
for FILE in dotfiles/{.bashrc,.bash_aliases,.vimrc,.vim}; do ln -sfrv $FILE `basename $FILE` ; done 

