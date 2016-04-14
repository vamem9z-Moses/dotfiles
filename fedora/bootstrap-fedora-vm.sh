#/usr/bin/env bash

echo "Install Generic workstation"
./bootstrap-fedora-workstation.sh

echo "Install and Configure Tuned"
sudo dnf install -y tuned
sudo systemctl enable tuned
sudo systemctl start tuned
sudo tuned-adm profile virtual-guest
