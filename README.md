# Steps to set up my vimrc (Only Linux)

1. Clone the repository:
   ```bash
   git clone https://github.com/arunlakshmanan/.vim.git
   cd .vim
   ```
1. Initialize the submodules:
   ```bash
   git submodule init
   git submodule update
   ```
1. Create the symlinks:
   ```bash
   ./createSymLink.sh
   ```
1. Download the patched fonts:
   ```bash
   ./createFonts.sh
   ```
1. Open the vimrc and install the plugins:
   ```
   vim .vimrc
   :PluginInstall
   ```

### Misc
* Use (instant markdown preview) [https://github.com/suan/vim-instant-markdown]
  for viewing markdown edits in real time.
