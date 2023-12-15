#!/bin/bash

#  ________    ______  _______    
# |_   __  | .' ___  ||_   __ \   Fernando G. Prieto
#   | |_ \_|/ .'   \_|  | |__) |  https://www.fernandogprieto.com/
#   |  _|   | |   ____  |  ___/   https://github.com/fernandogprieto
#  _| |_    \ `.___]  |_| |_      https://twitter.com/fernandogprieto 
# |_____|    `._____.'|_____| 
#
# Script created for personal use.
# last update: 2023-11-04
# Postinstall scripts -  https://www.fernandogprieto.com/projects/

# ---------------------------------------------------------------------------- #

# --------------------------------- VARIABLE---------------------------------- #

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

LINE=$(ColorGreen '# ---------------------------------------------------------------------------- #')

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


		# ----- PPAs -----#
		PPAS=(
			ppa:ansible/ansible 
			ppa:stellarium/stellarium-releases # Stellarium
			# ppa:graphics-drivers/ppa		   # Nvidia
			# ppa:libreoffice/ppa              # LibreOffice
		)

		## ----- APT  ----- ##
		PROGRAMS_APT=(
			# System
			lsb-release 
			gnupg
			gnupg2
			apt-transport-https 
			ca-certificates 
			software-properties-common
			dkms 
			linux-headers-generic 
			python3 
			python3-smbc
			python-is-python3
			python3-fontforge
			fontforge
			smbclient
			npm
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
			copyq

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
			groff
			psutils
			less
			glibc-source
			plocate

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
			
			#Cloud-Tools
			ansible
			ansible-core
			
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
			org.qbittorrent.qBittorrent
			io.neovim.nvim
		)

		## ----- Snap ----- ##
		PROGRAMS_SNAP=(
			inkscape
			skype
			pycharm-community
			jdownloader2
		)

		echo -e "$BLUE Updating package list && upgrade ... $CLEAR"
		
		sudo apt update -y
		sudo apt upgrade -y
		sudo apt autoremove -y 
		sudo apt autoclean 
		sudo snap refresh

		echo -ne "
		$LINE
		$(ColorBlue 'Repository') 
		$LINE"
		
		## ----- NPM Packages ----- ##
		NPM_PACKAGES=(
			@microsoft/fast-cli
		)

		## ----- NPM Development Packages ----- ##
		#NPM_DEV_PACKAGES=(
		#)
		
		## ----- Add PPA Packages ----- ##
		for ppa in ${PPAS[@]}; do
				if ! grep -q "^deb .*$ppa" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
						sudo apt-add-repository "$ppa" -y
				fi
		done

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

		## ----- NPM ----- ##
		sudo npm update

		for package_name in ${NPM_PACKAGES[@]}; do
    		if ! npm list -g | grep -q $package_name; then # Only install if it is not already installed globally
        				echo -e "\n\n${YELLOW}"$LINE
        				echo -e "  [INSTALLING] - $package_name ${NC}"
        				echo -e "${YELLOW}"$LINE"${NC}\n"

        				sudo npm install -g "$package_name"
    		fi
		done

# ---------------------------------------------------------------------------- #

# ------------------------------- APPLICATIONS ------------------------------- #
	# Source applications.sh to use its functions
	echo "Sourcing applications.sh to use its functions..."
			if [ -f "$(pwd)/applications.sh" ]; then
				chmod +x ./applications.sh
    			source ./applications.sh

    		# Call the inst-apps function to install applications
    			inst-apps
			else
    				echo "${RED}[ERROR] applications.sh does not exist or is not accessible. ${NC}"
    		exit 1
			fi

	
# ---------------------------------------------------------------------------- #

# ------------------------------- CLOUD TOOLS  ------------------------------- #
# DevOps, Cloud Tools, SRE. 

	echo "Sourcing cloud-tools.sh to use its functions..."
			if [ -f "$(pwd)/cloud-tools.sh" ]; then
				chmod +x ./cloud-tools.sh
    			source ./cloud-tools.sh

    		# Call the inst-apps function to install applications
    			inst-cloud-tools
			else
    				echo "${RED}[ERROR] cloud-tools.sh does not exist or is not accessible. ${NC}"
    		exit 1
			fi

# ---------------------------------------------------------------------------- #

# ------------------------------- POST INSTALL ------------------------------- #
		sudo apt install -y --fix-broken --install-recommends
		sudo flatpak update -y
		sudo flatpak repair
		sudo snap refresh
		sudo apt install -f && sudo apt autoremove -y && sudo apt autoclean && sudo apt clean
		npm update

fi # end Ubuntu

# ---------------------------------------------------------------------------- #

# ------------------------------- CHECKLIST ---------------------------------- #
# Add to the checklist section of postinstall.sh
echo -e "\nAPT's installed:"
for program_name in ${PROGRAMS_APT[@]}; do
	if dpkg -l | grep -q $program_name; then 
		echo -e "	${GREEN}[INSTALLED] - $program_name ${NC}"
	else
		echo -e "	${RED}[ERROR] - $program_name ${NC}"
	fi
done

echo -e "\nFLATPAK's installed:"
for program_name in ${PROGRAMS_FLATPAK[@]}; do
	if flatpak list | grep -q $program_name; then 
		echo -e "	${GREEN}[INSTALLED] - $program_name ${NC}"
	else
		echo -e "	${RED}[ERROR] - $program_name ${NC}"
	fi
done

echo -e "\nSNAP's installed:"
for program_name in ${PROGRAMS_SNAP[@]}; do
	if snap list | grep -q $program_name; then 
		echo -e "	${GREEN}[INSTALLED] - $program_name ${NC}"
	else
		echo -e "	${RED}[ERROR] - $program_name ${NC}"
	fi
done

echo -e "\nNPM packages installed:"
for package_name in ${NPM_PACKAGES[@]}; do
    if npm list -g | grep -q $package_name; then 
        echo -e "   ${GREEN}[INSTALLED] - $package_name ${NC}"
    else
        echo -e "	${RED}[ERROR] - $package_name ${NC}"
    fi
done

echo -e "\nApplications installed:"
source ./applications.sh
check-apps

echo -e "\nCloud-Tools installed:"
source ./cloud-tools.sh
check-cloud-tools

# echo -e "\n Reboot Now \n"
# ----------------------------------- END ------------------------------------ #