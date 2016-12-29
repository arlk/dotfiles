#!/bin/bash
########################################################

INSTALLED=$(dpkg -l neovim)
if [ "$INSTALLED" == "" ]; then
echo "Installing neovim...\n"
sudo apt-get install software-properties-common

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
fi

echo "Installing git and curl...\n"
sudo apt-get install git curl

echo "Installing python 2+3 and pip...\n"
sudo apt-get install python-dev python-pip python3-dev python3-pip

INSTALLED=$(dpkg -l vim)
if [ "$INSTALLED" == "" ]; then
  sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
fi
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60

if [ ! -d $HOME/.fzf ]; then
read -r -p "Install fzf? [y/N] " response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]; then
  echo "Installing fzf...\n"
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf 
  ~/.fzf/install
fi
fi

INSTALLED=$(dpkg -l silversearcher-ag)
if [ "$INSTALLED" == "" ]; then
read -r -p "Install ag? [y/N] " response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]; then
  echo "Installing ag...\n"
  sudo apt-get install silversearcher-ag
fi
fi

INSTALLED=$(dpkg -l zsh)
if [ "$INSTALLED" == "" ]; then
read -r -p "Install zsh? [y/N] " response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]; then
  echo "Installing zsh...\n"
  sudo apt-get install zsh
  echo "Installing zplug...\n"
  curl -sL zplug.sh/installer | zsh
  read -r -p "Make zsh default? [y/N] " response
  response=${response,,}
  if [[ $response =~ ^(yes|y)$ ]]; then
    chsh -s $(which zsh)
  fi
fi
fi

INSTALLED=$(dpkg -l xclip)
if [ "$INSTALLED" == "" ]; then
read -r -p "Install xclip? [y/N] " response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]; then
  echo "Installing xclip...\n"
  sudo apt-get install xclip
fi
fi

echo "Creating symlinks...\n"
./createSymLink.sh

echo "Installing vim-plug...\n"
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing vim plugins...\n"
nvim +PlugInstall
