#!/bin/bash
########################################################

echo "Installing neovim...\n"
apt-get install software-properties-common &&

add-apt-repository ppa:neovim-ppa/unstable &&
apt-get update &&
apt-get install neovim &&

apt-get install python-dev python-pip python3-dev python3-pip &&

INSTALLED=$(dpkg -l vim)
if [ $INSTALLED != "" ]; then
  update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
fi
update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60

read -r -p "Install fzf? [y/N] " response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]; then
  echo "Installing fzf...\n"
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf &&
  ~/.fzf/install &&
fi

read -r -p "Install ag? [y/N] " response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]; then
  echo "Installing ag...\n"
  apt-get install silversearcher-ag &&
fi

read -r -p "Install zsh? [y/N] " response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]; then
  echo "Installing zsh...\n"
  apt-get install zsh &&
  echo "Installing zplug...\n"
  curl -sL zplug.sh/installer | zsh &&
  read -r -p "Make zsh default? [y/N] " response
  response=${response,,}
  if [[ $response =~ ^(yes|y)$ ]]; then
    chsh -s $(which zsh)
  fi
fi

read -r -p "Install xclip? [y/N] " response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]; then
  echo "Installing xclip...\n"
  apt-get install xclip &&
fi

echo "Creating symlinks...\n"
source createSymLink.sh

echo "Installing vim-plug...\n"
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&

echo "Installing vim plugins...\n"
vim +PlugInstall
