# Steps to set up init.vim, bashrc, zshrc, gitconfig (requires Linux)

1. Clone the repository in your home directory:

    ```bash
    git clone https://github.com/arunlakshmanan/dotfiles.git
    ```

1. Use the install script if you use Debian:

    ```bash
    cd dotfiles
    sudo ./install.sh
    ```

1. Logout and login if you chose to make zsh your default shell.

## Manual setup (if you did _not_ use install.sh):

1. This setup requires:
    1. [nvim](https://github.com/neovim/neovim/wiki/Installing-Neovim).

        ```bash
        sudo apt-get install software-properties-common

        sudo add-apt-repository ppa:neovim-ppa/unstable
        sudo apt-get update
        sudo apt-get install neovim

        sudo apt-get install python-dev python-pip python3-dev python3-pip

        sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
        sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
        ```

    1. (Optional)[fzf](https://github.com/junegunn/fzf#installation)

        ```bash
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install
        ```

    1. (Optional)[ag](https://github.com/ggreer/the_silver_searcher)
        ```bash
        apt-get install silversearcher-ag
        ```

    1. (Optional) Install zsh+zplug for a better experience:
        ```bash
        sudo apt-get install zsh
        curl -sL zplug.sh/installer | zsh
        ```

    1. (Optional) xclip for easy copy from vim buffer:
        ```bash
        sudo apt-get install xclip
        ```

    1. Install [vim-plug](https://github.com/junegunn/vim-plug):
        ```
        curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        ```

1. Open the init.vim and install the plugins:

    ```
    nvim nvim/init.vim
    :PlugInstall
    ```
