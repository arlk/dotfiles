#!/bin/bash
########################################################

if [ "$EUID" -ne 0 ]
  then echo "Please run with sudo..."
  exit
fi

INSTALLED=$(dpkg -l neovim)
if [ $INSTALLED != "" ]; then
echo "Installing neovim...\n"
apt-get install software-properties-common &&

add-apt-repository ppa:neovim-ppa/unstable &&
apt-get update &&
apt-get install neovim
fi

echo "Installing git and curl...\n"
apt-get install git curl &&

echo "Installing python 2+3 and pip...\n"
apt-get install python-dev python-pip python3-dev python3-pip &&

INSTALLED=$(dpkg -l vim)
if [ $INSTALLED != "" ]; then
  update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
fi
update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60

if [ ! -d $HOME/.fzf ]; then
read -r -p "Install fzf? [y/N] " response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]; then
  echo "Installing fzf...\n"
  sudo -u $USER git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf &&
  sudo -u $USER /.fzf/install
fi
fi

INSTALLED=$(dpkg -l silversearcher-ag)
if [ $INSTALLED != "" ]; then
read -r -p "Install ag? [y/N] " response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]; then
  echo "Installing ag...\n"
  apt-get install silversearcher-ag
fi
fi

INSTALLED=$(dpkg -l zsh)
if [ $INSTALLED != "" ]; then
read -r -p "Install zsh? [y/N] " response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]; then
  echo "Installing zsh...\n"
  apt-get install zsh
  echo "Installing zplug...\n"
  sudo -u $USER curl -sL zplug.sh/installer | zsh
  read -r -p "Make zsh default? [y/N] " response
  response=${response,,}
  if [[ $response =~ ^(yes|y)$ ]]; then
    sudo -u $USER chsh -s $(which zsh)
  fi
fi
fi

INSTALLED=$(dpkg -l xclip)
if [ $INSTALLED != "" ]; then
read -r -p "Install xclip? [y/N] " response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]; then
  echo "Installing xclip...\n"
  apt-get install xclip
fi
fi

echo "Creating symlinks...\n"
sudo -u $USER source createSymLink.sh

echo "Installing vim-plug...\n"
sudo -u $USER curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing vim plugins...\n"
sudo -u $USER nvim +PlugInstall
