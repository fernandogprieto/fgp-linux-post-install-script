#!/bin/sh 
sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo vim /etc/apt/sources.list.d/winehq.list
#add - deb https://dl.winehq.org/wine-builds/debian/ bullseye main
sudo apt install --install-recommends winehq-stable
winecfg
#Install the Wine Mono and Wine Gecko 
#Select Version Windows 10
sudo apt-get install winetricks zenity
#Select create a new wineprefix with 32arq
#install app dll components search for mfc42 and vcrun6






