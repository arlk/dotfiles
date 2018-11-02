#!/bin/bash
########################################################

# Install some debian packages
DEB_PACKAGES='git gawk curl python python-pip python3 python3-pip silversearcher-ag neovim ruby ruby-dev xclip zsh tmux'
for PKG in $DEB_PACKAGES
do
  INSTALLED=$(dpkg -l $PKG)
  if [ "$INSTALLED" == "" ]; then
    echo "Installing $PKG ..."
    sudo apt install $PKG -y
  fi
done

# Use python3 for neovim
echo "Upgrading neovim..."
python3 -m pip install --user --upgrade neovim

# Install a patched nerd font
echo "Installing nerd fonts..."
mkdir -p ~/.local/share/fonts
(cd ~/.local/share/fonts && wget -q -O - https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/UbuntuMono.zip | busybox unzip -)
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_system_font --type=boolean false
gsettings set org.gnome.desktop.interface monospace-font-name 'UbuntuMono Nerd Font Mono 14'

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

# Install Hyper
read -r -p "Install hyper.js? [y/N] " response
response=${response,,}
if [[ $response =~ ^(yes|y)$ ]]; then
  echo "Installing hyper.js..."
  wget -q -O hyper.deb "https://releases.hyper.is/download/deb"
  sudo apt clean
  sudo dpkg -i hyper.deb
  sudo apt install -y -f
  sudo dpkg --configure -a
  rm -f hyper.deb
  read -r -p "Make hyper default? [y/N] " response
  response=${response,,}
  if [[ $response =~ ^(yes|y)$ ]]; then
    gsettings set org.gnome.desktop.default-applications.terminal exec hyper
    gsettings set org.gnome.desktop.default-applications.terminal exec-arg ''
  fi
fi

# Finish setting up
echo "Creating symlinks..."
./create_symlinks.sh

echo "Installing tmux plugins..."
 ~/.tmux/plugins/tpm/bin/install_plugins

echo "Installing vim plugins..."
nvim +PlugInstall +qall +silent
