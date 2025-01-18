#!/usr/bin/env bash

echo "Update apt and upgrade"
sudo apt update && sudo apt upgrade -y

echo "Install samba dependencies"
sudo apt install -y samba smbclient wsdd avahi-discover
