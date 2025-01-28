!#/bin/bash

# Check to ensure that bootstrap-repos.sh has been run first
if [ ! -f /etc/apt/sources.list.d/debian.sources ]; then
  echo "Run boostrap-repos.sh first"
  exit 1
fi

echo "Copy Bootstrap Sources to sources.list.d and update apt"
sudo cp backports.list /etc/apt/sources.list.d/
sudo apt update

echo "Install linux updated kernel and btrfs-progs"
sudo apt install -y -t bookworm-backports linux-image-amd64 linux-headers-generic btrfs-progs

echo "Install Cockpit Dependencies"
sudo apt install -y pcp python3-pcp udisks2-bcache udisks2-btrfs udisks2-doc udisks2-lvm2 udisks2-zram

echo "Install Cockpit"
sudo apt install -y -t bookworm-backports cockpit cockpit-bridge cockpit-doc cockpit-machines cockpit-networkmanager cockpit-packagekit cockpit-podman cockpit-sosreport cockpit-storaged cockpit-system cockpit-ws
