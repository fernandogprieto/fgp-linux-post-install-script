#!/bin/sh
sudo apt install build-essential dkms linux-headers-$(uname -r)
wget https://www.virtualbox.org/wiki/Linux_Downloads
dpkg -i *.deb
#Config Virtual box for test(server) https://bit.ly/3eS1SY0

wget https://www.genymotion.com/download-handler?download=ubu_first_64_download_link
chmod +x  genymotion-3.2.1-linux_x64.bin
./genymotion-3.2.1-linux_x64.bin
cd Genymotion/.genymotion
sudo ln -sf ~/genymotion/gmtool /usr/local/bin/
sudo ln -sf ~/genymotion/genyshell /usr/local/bin/
sudo ln -sf ~/genymotion/genymotion /usr/local/bin/
