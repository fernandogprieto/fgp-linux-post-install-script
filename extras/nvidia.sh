#!/bin/sh
sudo dpkg --add-architecture i386
sudo apt install linux-headers-$(uname -r) build-essential libc6:i386 nvidia-detect -y
sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
cat /etc/modprobe.d/blacklist-nvidia-nouveau.conf ##Should be blacklist nouveau options nouveau modeset=0
systemctl set-default multi-user.target
sudo update-initramfs -u
systemctl reboot

sudo bash NVIDIA-Linux-x86_64-390.147.run
# Install 32libs --- Yes
# Install and overwrite existing filesort installation
# Would you like to run the nvidia-xconfig    ---Yes

systemctl set-default graphical.target
systemctl reboot

#xrandr --output VGA-0 --mode 1600x900
