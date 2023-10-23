#!/bin/sh 

sudo apt install libx11-dev libxft-dev libxinerama-dev nano sudo curl -y

##/sbin/adduser myuser sudo

##python3-gi python-gobject 
sudo apt-get install python3 python3-pip libpangocairo-1.0-0 alsa-utils pavucontrol pcmanfm suckless-tools python3-gi -y
pip3 install xcffib dbus-python autokey dbus-next
pip3 install --no-cache-dir cairocffi

##Desktop and Tools
sudo apt install xinput synaptic thunar thunar-media-tags-plugin thunar-vcs-plugin thunar-volman cups cups-pdf nitrogen lxappearance qt5-style-plugins -y
sudo apt install qbittorrent gufw htop gparted bleachbit llvm clang default-jdk make p7zip p7zip-full unrar-free unzip lshw cmake build-essential -y
sudo apt install apt-transport-https gnupg software-properties-common feh compton nodejs npm -y

npm install xterm

##Browser
sudo apt-get install firefox-esr
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb

wget -O- https://deb.opera.com/archive.key | sudo apt-key add –
sudo add-apt-repository "deb [arch=i386,amd64] https://deb.opera.com/opera-stable/ stable non-free"
sudo apt update && sudo apt install opera-stable -y

##Sounds, Codecs and Players
sudo apt install pulseaudio pulseaudio-utils pavucontrol pulseaudio-dlna pulseaudio-equalizer gstreamer1.0-pulseaudio -y
sudo apt install alsa-utils gstreamer1.0-alsa alsamixergui alsaplayer-gtk alsa-player-daemon alsa-player-common alsa-player-alsa -y
sudo apt-get install libao4 libasound2 exfat-utils vlc mplayer mpv audacity obs-studio -y

##Spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install spotify-client -y

##Network
sudo apt install network-manager network-manager-openvpn network-manager-openvpn-gnome samba samba-common samba-libs cifs-utils libcups2 cups smbclient -y
sudo apt install gvfs-backends net-tools ssh ssh-tools openssl ca-certificates gnupg2 openssh-server rsync -y

##Images and Docs
sudo apt install calibre xfce4-screenshooter eog gimp inkscape digikam darktable -y
sudo apt install g++ cmake make build-essential qttools5-dev-tools libqt5svg5-dev qttools5-dev -y
sudo apt install libqt5dbus5 libqt5network5 libqt5core5a libqt5widgets5 libqt5gui5 libqt5svg5 -y

##Meetpus and Social Chat
##Zoom
sudo apt install libglib2.0-0 libgstreamer-plugins-base1.0-0 libxcb-shape0 libxcb-shm0 libxcb-xfixes-0 -y
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo dpkg -i zoom_amd64.deb 
sudo apt-get -f install -y

## Discord
sudo apt install libappindicator3-0.1-cil libc++1 -y
wget https://dl.discordapp.net/apps/linux/0.0.17/discord-0.0.17.tar.gz
tar -xzvf discord-0.0.17.tar.gz
sudo mv Discord /opt
sudo ln -sf /opt/Discord/Discord /usr/bin/discord

##Telegram Desktop
wget https://telegram.org/dl/desktop/linux 
tar xvf tsetup*.tar.xz
sudo mv Telegram/ /opt/
sudo ln -sf /opt/Telegram/Telegram /usr/bin/telegram
#If you have a problem with wget try mv linux tsetup.tar.xz then begin to descompress it!



