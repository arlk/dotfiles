# Steps to set up init.vim, bashrc, gitconfig (requires neovim + Linux)

1. You can also use this with
   [nvim](https://github.com/neovim/neovim/wiki/Installing-Neovim):

1. Clone the repository in your home directory:

    ```bash
    mkdir -p ~/.config
    git clone https://github.com/arunlakshmanan/nvim.git
    cd .config/nvim
    ```

1. Install [vim-plug](https://github.com/junegunn/vim-plug)

1. Create the symlinks for bashrc and gitconfig:

    ```bash
    ./createSymLink.sh
    ```
1. Open the init.vim and install the plugins:

    ```
    nvim init.vim
    :PlugInstall
    ```

### Misc
* Use [instant markdown preview](https://github.com/suan/vim-instant-markdown)
  for viewing markdown edits in real time.
