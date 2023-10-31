#!/bin/bash

#  ________    ______  _______    
# |_   __  | .' ___  ||_   __ \   Fernando G. Prieto
#   | |_ \_|/ .'   \_|  | |__) |  https://www.fernandogprieto.com/
#   |  _|   | |   ____  |  ___/   https://github.com/fernandogprieto
#  _| |_    \ `.___]  |_| |_      https://twitter.com/fernandogprieto 
# |_____|    `._____.'|_____| 
#
# Script created for personal use.
# last update: 2023-10-31
# Scripts -  https://www.fernandogprieto.com/projects/

# ---------------------------------------------------------------------------- #

# --------------------------------- VARIABLE---------------------------------- #

LINE=$(ColorGreen '# ---------------------------------------------------------------------------- #')

GREEN='\e[32m'
BLUE='\e[34m'
YELLOW='\033[0;33m'
CLEAR='\e[0m'
RED='\033[0;31m'
NC='\033[0m'

ColorGreen() {
	echo -ne $green$1$clear
}
ColorBlue() {
	echo -ne $blue$1$clear
}
# ---------------------------------------------------------------------------- #

echo -e "$BLUE Checking OS type... $CLEAR"

OS="$(. /etc/os-release && echo $ID)"
if [[ "${OS}" == "ubuntu" ]]
then
	OS_UBUNTU=1
else
	echo -e "$RED OS not supported $CLEAR" 
    exit 1
fi

# ---------------------------------------------------------------------------- #

# --------------------------------- UBUNTU ----------------------------------- #
if [[ -n "${OS_UBUNTU-}" ]]
then
		PPAS=(
		# ppa:graphics-drivers/ppa		   # Nvidia
		# ppa:libreoffice/ppa                # LibreOffice
		# ppa:stellarium/stellarium-releases # Stellarium
		)

		# Desktop adjustments
		echo -e "$BLUE Applying desktop adjustments... $CLEAR"

		gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'LEFT'
		gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
		gsettings set org.gnome.shell.extensions.dash-to-dock always-center-icons false
		gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-always-in-the-edge false

		gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
		gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 28
		gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts-network false
		gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts-only-mounted true

		gsettings set org.gnome.shell.extensions.ding show-home false
		gsettings set org.gnome.shell.extensions.ding keep-arranged true
		gsettings set org.gnome.shell.extensions.ding start-corner 'top-right'

		echo -e "$GREEN Desktop adjustments applied. $CLEAR"

		## ----- APT  ----- ##
		PROGRAMS_APT=(
			# System
			lsb-release 
			gnupg 
			apt-transport-https 
			ca-certificates 
			software-properties-common
			dkms 
			linux-headers-generic 
			python3 
			python3-smbc 
			smbclient
			exfat-fuse 
			hfsprogs 
			libfuse2 
			exfat-fuse
			ffmpeg
			chromium-codecs-ffmpeg-extra
			laptop-mode-tools
			lsb
			nautilus-image-converter
			net-tools
			rar
			ubuntu-wallpapers
			ufw
			unrar
			unzip
			v4l2loopback-dkms
			wmctrl
			zip
			dialog
			tilix
			jq
			exa
			dnsutils
			traceroute
			inetutils-traceroute
			gufw 
			hardinfo 
			dconf-editor 
			synaptic 
			uget 
			gitg
			psensor
			vnstat
			openvpn
			whois
			nmap
			netcat
			id-utils

			# CLI
			cmatrix
			git
			btop
			htop
			neofetch
			mc
			build-essential 
			curl
			wget
			git 
			nano
			vim 
			tree 

			# Gnome
			chrome-gnome-shell
			dconf-editor
			gnome-backgrounds
			gnome-clocks
			gnome-firmware
			gnome-maps
			gnome-shell-extensions
			gnome-software-plugin-flatpak
			gnome-sushi
			gnome-tweaks
			gnome-weather
			gparted gpart
			
			# virtualization
			qemu-system 
			virt-manager 
			bridge-utils
			
			# Programs
			audacity
			cpu-x
			flatpak
			remmina
			stellarium
			# virtualbox
			# virtualbox-dkms
			
			# Fonts
			fonts-apropal
			fonts-atarismall
			fonts-baekmuk
			fonts-bajaderka
			fonts-blankenburg
			fonts-cantarell
			fonts-comfortaa
			fonts-dejavu-extra
			fonts-fanwood
			fonts-firacode
			fonts-font-awesome
			fonts-gamaliel
			fonts-glasstty
			fonts-hack
			fonts-hack-ttf
			fonts-havana
			fonts-junicode
			fonts-lato
			fonts-league-spartan
			fonts-lemonada
			fonts-le-murmure
			fonts-lexi-gulim
			fonts-lindenhill
			fonts-lmodern
			fonts-lyx
			fonts-millimetre
			fonts-mplus
			fonts-nanum
			fonts-noto
			fonts-noto-color-emoji
			fonts-open-sans
			fonts-osifont
			fonts-oxygen
			fonts-paratype
			fonts-powerline
			fonts-prociono
			fonts-roboto
			fonts-roboto-slab
			fonts-tomsontalks
			fonts-ubuntu-console
			fonts-vollkorn
			fonts-yanone-kaffeesatz
			ttf-ancient-fonts
			ttf-mscorefonts-installer
		)

		## ----- Flatpak ----- ##
		PROGRAMS_FLATPAK=(
			com.bitwarden.desktop
			com.discordapp.Discord
			org.telegram.desktop
			com.obsproject.Studio
			com.slack.Slack
			com.spotify.Client
			org.gimp.GIMP
			com.calibre_ebook.calibre
			com.github.hluk.copyq
			org.qbittorrent.qBittorrent
			io.neovim.nvim
		)

		## ----- Snap ----- ##
		PROGRAMS_SNAP=(
			inkscape
			skype
			pycharm-community --classic
		)

		echo -e "$BLUE Updating package list && upgrade ... $CLEAR"
		
		sudo apt update -y
		sudo apt upgrade -y
		sudo apt autoremove -y 
		sudo apt autoclean 
		sudo snap refresh

		echo -ne "
		$LINE
		$(ColorGreen '---------') $(ColorBlue 'Repository') $(ColorGreen '---------')
		$LINE"
		

# ---------------------------------------------------------------------------- #

# --------------------------------- EXECUTE ---------------------------------- #

		for program_name in ${PROGRAMS_APT[@]}; do
				if ! dpkg -l | grep -q $program_name; then # Only install if it is not already installed
						echo -e "\n\n${YELLOW}"$LINE
						echo -e "	[INSTALLING] - $program_name ${NC}"
						echo -e "${YELLOW}"$LINE"${NC}\n"

						sudo apt install "$program_name" -y -q
				fi
		done

		# remove softwares
		sudo apt purge -y \
			aisleriot gnome-mahjongg gnome-mines gnome-sudoku \
			transmission \
			totem \
			usb-creator-gtk \
			libreoffice* 
		
		# disable apt ads
		sudo pro config set apt_news=false
		sudo systemctl disable ubuntu-advantage

		# restricted extras
		echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
		sudo apt install -y ubuntu-restricted-extras

		#Update
		echo -e "$BLUE Updating package list && upgrade ... $CLEAR"
		sudo apt install -f && sudo apt autoremove -y && sudo apt autoclean && sudo apt clean

		## ----- Flatpak ---- -##
		sudo flatpak update -y
		flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

		for program_name in ${PROGRAMS_FLATPAK[@]}; do
				if ! flatpak list | grep -q $program_name; then # Only install if it is not already installed
						echo -e "\n\n${YELLOW}"$LINE
						echo -e "	[INSTALLING] - $program_name ${NC}"
						echo -e "${YELLOW}"$LINE"${NC}\n"

						flatpak install flathub "$program_name" -y
				fi
		done

		## ----- Snap ----- ##
		sudo snap refresh

		for program_name in ${PROGRAMS_SNAP[@]}; do
				if ! snap list | grep -q $program_name; then # Only install if it is not already installed
						echo -e "\n\n${YELLOW}"$LINE
						echo -e "	[INSTALLING] - $program_name ${NC}"
						echo -e "${YELLOW}"$LINE"${NC}\n"

						sudo snap install "$program_name"
				fi
		done
# ---------------------------------------------------------------------------- #

# ------------------------------- POST INSTALL ------------------------------- #
		sudo apt install -y --fix-broken --install-recommends
		sudo flatpak update -y
		sudo flatpak repair
		sudo snap refresh
		sudo apt install -f && sudo apt autoremove -y && sudo apt autoclean && sudo apt clean

fi # end Ubuntu

# ---------------------------------------------------------------------------- #

# ------------------------------- APPLICATIONS ------------------------------- #
		
		# Chrome
		wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
		sudo chmod +x ./google-chrome-stable_current_amd64.deb
		sudo dpkg -i ./google-chrome-stable_current_amd64.deb
		rm -rf ./google-chrome-stable_current_amd64.deb

		# Microsoft Edge
		wget -O - https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/microsoft.gpg
		sudo rm /etc/apt/sources.list.d/microsoft-edge*.list
		sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge.list'
		sudo apt update
		sudo apt install microsoft-edge-stable

		# VScode
		wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
		sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
		sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
		rm -f packages.microsoft.gpg
		sudo apt update
		sudo apt install code

		# Anydesk
		wget -qO- https://keys.anydesk.com/repos/DEB-GPG-KEY| sudo gpg --dearmor -o /usr/share/keyrings/anydesk-stable-keyring.gpg
		echo "deb [arch=amd64 signed-by=/usr/share/keyrings/anydesk-stable-keyring.gpg] http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
		sudo apt update
		sudo apt install anydesk

		# Nordvpn
		sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)
		sudo usermod -aG nordvpn $USER
		# ------ Reboot OS ---------#
		# nordvpn login
		# nordvpn connect

		# Libraries
		sudo apt install npm -y
		curl -fsSL https://deb.nodesource.com/test | bash -

#	env QT_QPA_PLATFORM=xcb copyq
	#Exec=env QT_QPA_PLATFORM=xcb copyq
	#https://copyq.readthedocs.io/en/latest/known-issues.html
