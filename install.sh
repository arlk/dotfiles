#!/bin/bash
########################################################

# Install some debian packages
DEB_PACKAGES='git gawk curl python python-pip python3 python3-pip silversearcher-ag ruby ruby-dev xclip zsh tmux'
for PKG in $DEB_PACKAGES
do
  INSTALLED=$(dpkg -l $PKG)
  if [ "$INSTALLED" == "" ]; then
    echo "Installing $PKG ..."
    sudo apt install $PKG -y
  fi
done

INSTALLED=$(dpkg -l neovim)
if [ "$INSTALLED" == "" ]; then
  sudo apt-add-repository ppa:neovim-ppa/stable
  sudo apt update
  echo "Installing neovim ..."
  sudo apt install neovim -y
fi
# Use python3 for neovim
python3 -m pip install --user --upgrade neovim

# Install colorls
echo "Installing colorls..."
sudo gem install colorls

# Install FZF
echo "Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all --no-bash --no-zsh --no-fish

# Install zsh-plug
echo "Installing zplug..."
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
echo "Installing zsh-autosuggestions..."
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
read -r -p "Make zsh default? [y/N] " response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]; then
  chsh -s $(which zsh)
fi

# Install tmux-plug
echo "Installing tmux-plug..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install vim-plug
echo "Installing vim-plug..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Finish setting up
echo "Creating symlinks..."
./create_symlinks.sh

echo "Installing tmux plugins..."
 ~/.tmux/plugins/tpm/bin/install_plugins

echo "Installing vim plugins..."
nvim +PlugInstall +qall +silent
