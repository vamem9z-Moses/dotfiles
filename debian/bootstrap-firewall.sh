#!/usr/bin/env bash

echo "Update and upgrade Apt"
sudo apt update && sudo apt upgrade -y

echo "Install UFW"
sudo apt install UFW

echo "Setup Firewall Rules for SSH"
sudo ufw allow from 192.168.200.0/24 proto tcp to any port 22

echo "Setup Firewalls for Samba and Windows Discovery Service"
# Samba Rules
sudo ufw allow from 192.168.200.0/24 proto tcp to any port 139
sudo ufw allow from 192.168.200.0/24 proto tcp to any port 145
sudo ufw allow from 192.168.200.0/24 proto udp to any port 137
# Windows Discovery Service
sudo ufw allow from 192.168.200.0/24 proto tcp to any port 135

echo "Enable UFW"
sudo ufw enable
