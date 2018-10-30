#!/bin/bash
########################################################

command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew Now"; \
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

INSTALLED=$(brew cask ls --versions xquartz)
if [ "$INSTALLED" == "" ]; then
  echo "Installing xquartz ..."
  brew cask install xquartz
  echo "Logout and login!"
  exit 1
fi

# Install some brew packages
BREW_PACKAGES='git python coreutils awk tmux zsh the_silver_searcher neovim xclip'
for PKG in $BREW_PACKAGES
do
  INSTALLED=$(brew ls --versions $PKG)
  if [ "$INSTALLED" == "" ]; then
    echo "Installing $PKG ..."
    brew install $PKG
  fi
done

# Use python3 for neovim
echo "Upgrading neovim..."
python3 -m pip install --user --upgrade neovim

# Install a patched nerd font
echo "Installing nerd fonts..."
brew tap caskroom/fonts
brew cask install font-ubuntumono-nerd-font-mono

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
  echo "/usr/local/bin/zsh" | sudo tee --append /etc/shells
  chsh -s $(which zsh)
fi

# Install tmux-plug
echo "Installing tmux-plug..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install vim-plug
echo "Installing vim-plug..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

INSTALLED=$(brew cask ls --versions hyper)
if [ "$INSTALLED" == "" ]; then
  echo "Installing hyper ..."
  brew cask install hyper
  exit 1
fi

# Finish setting up
echo "Creating symlinks..."
./create_symlinks.sh

echo "Installing tmux plugins..."
 ~/.tmux/plugins/tpm/bin/install_plugins

echo "Installing vim plugins..."
nvim +PlugInstall
