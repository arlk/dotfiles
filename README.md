# Steps to set up my vimrc (Only Linux)

* Clone the repository
 `git clone https://github.com/arunlakshmanan/.vim.git`
 `cd .vim`
* Initialize the submodules
 `git submodule init`
 `git submodule update`
* Create the symlinks
 `./createSymLink.sh`
* Download the patched fonts
 `./createFonts.sh`
* Open the vimrc and install the plugins
 `vim .vimrc`
 `:PluginInstall`
