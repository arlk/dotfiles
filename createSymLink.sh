#!/bin/bash
########################################################

dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

bak=~/dotfiles-backup

dotfiles="bashrc gitconfig"

echo "Storing dot files at $bak ..."
mkdir -p $bak
for file in $dotfiles; do
    if [ -L ~/.$file ]; then
      rm ~/.$file
    else
      mv ~/.$file $bak
    fi
done

echo "Now creating symbolic links for new dot files"
for file in $dotfiles; do
    ln -s $dir/.$file ~/.$file
done

echo "Done successfully!"
