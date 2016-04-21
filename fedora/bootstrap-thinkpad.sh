#!/usr/bin/env bash

#Install Thinkpad Specific Packages
sudo dnf install -y --nogpgcheck http://repo.linrunner.de/fedora/tlp/repos/releases/tlp-release-1.0-0.noarch.rpm

sudo dnf install akmod-tp_smapi akmod-acpi_call kernel-devel thinkfan

sudo systemctl enable thinkfan
sudo systemctl start thinkfan
