#!/bin/bash
########################################################

dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

bak=~/dotfiles-backup

dotfiles="bashrc vimrc gitconfig"

echo "Storing dot files at $bak ..."
mkdir -p $bak
for file in $dotfiles; do
    mv ~/.$file $bak
done

echo "Now creating symbolic links for new dot files"
for file in $dotfiles; do
    ln -s $dir/.$file ~/.$file
done

echo "Done successfully!"
