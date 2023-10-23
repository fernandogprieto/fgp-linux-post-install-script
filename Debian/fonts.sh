#!/bin/sh 
sudo apt-get install fonts-firacode fonts-font-awesome ttf-mscorefonts-installer -y
sudo apt-get -f install fonts-noto -y
sudo mkdir /usr/share/fonts/truetype/ubuntu
git clone https://github.com/supermarin/YosemiteSanFranciscoFont 
sudo mkdir /usr/share/fonts/truetype/yosemite
git clone https://github.com/powerline/fonts
./install.sh
sudo mv /home/$USER/.local/share/fonts/*Powerline* /usr/share/fonts/powerline
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Ubuntu.zip
unzip Ubuntu.zip
mkdir -p ~/.local/share/fonts/nerdfonts/ubuntu
mv *.ttf ~/.local/share/fonts/nerdfonts/ubuntu
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SpaceMono.zip
unzip SpaceMono.zip
mkdir -p ~/.local/share/fonts/nerdfonts/spacemono
mv *.ttf ~/.local/share/fonts/nerdfonts/spacemono
fc-cache -f -v
sudo apt-get install texlive-full texlive-lang-all lyx -y
