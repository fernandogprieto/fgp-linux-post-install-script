# Install Nvidia - Software Update select private user.
#
sudo apt install acl aria2 byobu curl elinks ethtool exfat-fuse exfat-utils fail2ban git iftop iperf3 libstring-mkpasswd-perl mc molly-guard net-tools pigz rsync vim wget 
sudo apt-get install apt-transport-https gnupg software-properties-common feh compton nodejs npm -y
sudo apt install xorg python3-xcffib python3-pip python3-cairocffi libcairo2 lightdm python3-psutil
sudo apt-get install lxappearance fish suckless-tools python3 python3-pip libpangocairo-1.0-0 alsa-utils pavucontrol pcmanfm suckless-tools python3-gi libx11-dev libxft-dev libxinerama-dev -y
pip3 install xcffib dbus-python autokey dbus-next

sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo dpkg -i anydesk_6.1.1-1_amd64.deb 
sudo apt-get install blueman bluez-utils bluez bluetooth
sudo apt install gnome-shell-extension-gpaste
sudo apt-get install audacity obs-studio libao4 libasound2 exfat-utils -y
sudo apt-get install audacity obs-studio vlc libao4 libasound2  -y
sudo apt install network-manager network-manager-openvpn network-manager-openvpn-gnome
sudo apt-get install cifs-utils libcups2 cups 
sudo apt install gvfs-backends net-tools ssh ssh-tools openssl ca-certificates gnupg2 openssh-server rsync -y
sudo apt install calibre gimp inkscape -y

sudo snap install vlc, spotify firefox opera discord telegram

#Flatpak
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
sudo apt install flatpak gnome-software-plugin-flatpak gnome-software
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.usebottles.bottles
flatpak run com.usebottles.bottles





