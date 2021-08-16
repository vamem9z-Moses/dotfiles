#!/bin/sh

# Install MySQL

echo "Installing MySQL and phpMyAdmin"

sudo dnf install -y community-mysql-server phpMyAdmin

echo "Start Services for MySQL and phpMyadmin"

sudo systemctl start mysqld
sudo systemctl enable mysqld
sudo systemctl start httpd
sudo systemctl enable httpd

echo "Secure MySQL Installation"

sudo mysql_secure_installation
