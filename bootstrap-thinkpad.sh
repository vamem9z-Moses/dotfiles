#!/usr/bin/env bash

# Update
echo "Update Computer"

sudo apt-get update
sudo apt-get -y upgrade


# Install Thinkpad Specfics
echo "Install Thinkpad Specifics"
sudo apt-get install -y tp-smapi-dkms acpi-call-tools thinkfan

