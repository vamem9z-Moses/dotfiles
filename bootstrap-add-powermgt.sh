#!/usr/bin/env bash

# Install Power Management
echo "Install Power Management"

sudo add-apt-repository -y ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install -y tlp tlp-rdw powertop
