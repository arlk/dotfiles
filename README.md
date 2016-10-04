# Steps to set up init.vim, bashrc, gitconfig (requires neovim + Linux)

1. Install
   [nvim](https://github.com/neovim/neovim/wiki/Installing-Neovim).

1. This setup requires:
    1. [fzf](https://github.com/junegunn/fzf#installation)
    2. [ag](https://github.com/ggreer/the_silver_searcher)

1. Clone the repository in your home directory:

    ```bash
    git clone https://github.com/arunlakshmanan/dotfiles.git
    mkdir -p ~/.config
    ln -s ~/dotfiles/nvim ~/.config/nvim
    ```

1. Install [vim-plug](https://github.com/junegunn/vim-plug)

1. Create the symlinks:

    ```bash
    ./createSymLink.sh
    ```
1. Open the init.vim and install the plugins:

    ```
    nvim init.vim
    :PlugInstall
    ```
