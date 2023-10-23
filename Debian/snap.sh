#!/bin/sh
sudo apt install snapd -y
sudo systemctl restart snapd
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install core
#Example core 16-2.51.7 from Canonical✓ installed
