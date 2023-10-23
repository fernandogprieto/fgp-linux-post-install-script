#!/bin/sh 
sudo apt install neovim
# Install vim plug from github
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

wget https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.55.2-1618307277_amd64.deb
sudo dpkg -i code*.deb
sudo apt install python3-sphinx lolcat figlet feh ranger rxvt-unicode powerline mousepad -y
