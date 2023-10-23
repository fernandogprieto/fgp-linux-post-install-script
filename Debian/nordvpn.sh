#!/bin/sh
sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)
sudo usermod -aG nordvpn $USER
sudo reboot

sudo apt-get install openvpn ca-certificates unzip
cd /etc/openvpn
wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
cd /etc/openvpn/ovpn_udp/
cd /etc/openvpn/ovpn_tcp/

Reading package 
#nordvpn login
#sudo openvpn [file name]
#sudo openvpn us2957.nordvpn.com.udp.ovpn
#sudo openvpn /etc/openvpn/ovpn_udp/us2957.nordvpn.com.udp.ovpn
# For more information
#https://support.nordvpn.com/Connectivity/Linux/1325531132/Installing-and-using-NordVPN-on-Debian-Ubuntu-Raspberry-Pi-Elementary-OS-and-Linux-Mint.htm
