#!/bin/bash
########################################################

dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

bak=~/backup-dotfiles

dotfiles="zshrc bashrc gitconfig"
folders="nvim"

read -r -p "Symlink .zshrc, .bashrc, .gitconfig? [y/N] " response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]; then
  echo "Storing dot files at $bak ..."
  mkdir -p $bak
  for file in $dotfiles; do
      if [ -L ~/.$file ]; then
        rm ~/.$file
      elif [ -f ~/.$file ]; then
        mv ~/.$file $bak
      fi
  done

  echo "Now creating symbolic links for new dot files"
  for file in $dotfiles; do
      ln -sf $dir/.$file ~/.$file
  done
fi

read -r -p "Symlink init.vim? [y/N] " response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]; then
  echo "Symlinking neovim"
  mkdir -p ~/.config
  if [ -L ~/.config/nvim ]; then
    rm ~/.config/nvim
  elif [ -f ~/.config/nvim ]; then
    mv ~/.config/nvim $bak
  fi
  ln -sf $dir/nvim ~/.config/nvim
fi

echo "Done successfully!"
