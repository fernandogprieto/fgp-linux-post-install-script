#!/bin/sh
apt-get install gzip cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y
sudo apt-get install cargo -y
cargo install alacritty 

#If show error:
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup override set stable
rustup update stable
cargo build --release
infocmp alacritty
sudo mv alacritty/ /opt/
sudo cp /opt/alacritty/target/release/alacritty /usr/local/bin/
sudo cp /opt/alacritty/extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install /opt/alacritty/extra/linux/Alacritty.desktop
sudo update-desktop-database
sudo mkdir -p /usr/local/share/man/man1
gzip -c /opt/alacritty/extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
gzip -c /opt/alacritty/extra/alacritty-msg.man | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
mkdir -p ~/.bash_completion
cp /opt/alacritty/extra/completions/alacritty.bash ~/.bash_completion/alacritty

#Neofetch
sudo apt-get install neofetch -y
neofetch --config off --bold off --colors 4 1 8 8 8 7

