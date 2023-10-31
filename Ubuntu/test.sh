#!/bin/bash

#  ________    ______  _______    
# |_   __  | .' ___  ||_   __ \   Fernando G. Prieto
#   | |_ \_|/ .'   \_|  | |__) |  https://www.fernandogprieto.com/
#   |  _|   | |   ____  |  ___/   https://github.com/fernandogprieto
#  _| |_    \ `.___]  |_| |_      https://twitter.com/fernandogprieto 
# |_____|    `._____.'|_____| 
#
# Script created for personal use.
# last update: 2023-10-29
# Scripts -  https://www.fernandogprieto.com/projects/

# ---------------------------------------------------------------------------- #

# --------------------------------- VARIABLE---------------------------------- #

GREEN='\e[32m'
BLUE='\e[34m'
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
		echo -e "$BLUE Updating package list... $CLEAR"
		sudo apt update

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
fi
