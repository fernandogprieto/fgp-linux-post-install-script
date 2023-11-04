
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
# Applications Scripts -  https://www.fernandogprieto.com/projects/

# ---------------------------------------------------------------------------- #

# --------------------------------- VARIABLE---------------------------------- #


GREEN='\e[32m'
BLUE='\e[34m'
YELLOW='\033[0;33m'
CLEAR='\e[0m'
RED='\033[0;31m'
NC='\033[0m'

# ---------------------------------------------------------------------------- #


# Check if Google Chrome is installed
function google-chrome-stable() {
	    google_chrome_v=$(google-chrome --version)
	    if ! command -v google-chrome &> /dev/null; then
 	        echo -e "$RED Chrome is not installed. Installing Chrome... $CLEAR"

            url= "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
            filename="google-chrome-stable_current_amd64.deb"
            wget $url
            sudo dpkg -i $filename
            rm -rf $filename

    	    echo -e "$GREEN Chrome ($google_chrome_v) The program has been installed correctly. $CLEAR"
	    else
    	    echo -e "$YELLOW The installation of Chrome already exists ($google_chrome_v). $CLEAR"
	    fi
}

# Check if Microsoft Edge is installed
function microsoft-edge-stable(){
        microsoft_edge_v=$(microsoft-edge --version)
        if ! command -v microsoft-edge &> /dev/null; then
            echo -e "$RED Edge is not installed. Installing Edge... $CLEAR"

            wget -O - https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/microsoft.gpg
		    sudo rm /etc/apt/sources.list.d/microsoft-edge*.list
		    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge.list'
		    sudo apt update
		    sudo apt install microsoft-edge-stable

            echo -e "$GREEN Edge ($microsoft_edge_v) The program has been installed correctly. $CLEAR"
        else
            echo -e "$YELLOW The installation of Edge already exists ($microsoft_edge_v). $CLEAR"
	    fi
}

# Check if VScode is installed
function code-stable(){
        code_v=$(code --version)
        if ! command -v code &> /dev/null; then
            echo -e "$RED VScode is not installed. Installing VScode... $CLEAR"

            wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
		    sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
		    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
		    rm -f packages.microsoft.gpg
		    sudo apt update
		    sudo apt install code

            echo -e "$GREEN VScode ($code_v) The program has been installed correctly. $CLEAR"
        else
            echo -e "$YELLOW The installation of VScode already exists ($code_v). $CLEAR"
	    fi
}

# Check if Anydesk is installed
function anydesk-current(){ 
        if ! command -v anydesk &> /dev/null; then
            echo -e "$RED Anydesk is not installed. Installing Anydesk... $CLEAR"

        wget -qO- https://keys.anydesk.com/repos/DEB-GPG-KEY| sudo gpg --dearmor -o /usr/share/keyrings/anydesk-stable-keyring.gpg
		    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/anydesk-stable-keyring.gpg] http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
            sudo apt update
            sudo apt install anydesk

            echo -e "$GREEN Anydesk  The program has been installed correctly. $CLEAR"
        else
            echo -e "$YELLOW The installation of Anydesk already exists. $CLEAR"
	    fi
}

# Check if Nordvpn is installed
function nordvpn-stable(){
        nordvpn_v=$(nordvpn --version)
        if ! command -v nordvpn &> /dev/null; then
             echo -e "$RED Nordvpn is not installed. Installing Nordvpn... $CLEAR"
        
        sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)
		sudo usermod -aG nordvpn $USER
            echo -e "$GREEN Nordvpn ($nordvpn_v) The program has been installed correctly. $CLEAR"
        else
            echo -e "$YELLOW The installation of Nordvpn ($nordvpn_v) already exists. $CLEAR"
	    fi
        
        # ------ Reboot OS ---------#
		# nordvpn login
		# nordvpn connect
}

# Install applications
function inst-apps(){
     google-chrome-stable
     microsoft-edge-stable
     code-stable
     anydesk-current
     nordvpn-stable
}

# Call the function to install the applications
#inst-apps

# Define an array of application commands
declare -a app_commands=(
  "google-chrome-stable" 
  "microsoft-edge-stable" 
  "code" 
  "anydesk" 
  "nordvpn"
  )

# Check if applications were installed correctly
function check-apps() {
  for app_command in "${app_commands[@]}"; do
    if command -v "$app_command" &> /dev/null; then
      echo -e "   ${GREEN}[INSTALLED] - $app_command ${NC}"
    else
      echo -e "   ${RED}[ERROR] - $app_command ${NC}"
    fi
  done
}

# Call the function to check the applications
#check-apps
