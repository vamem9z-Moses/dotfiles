#!/usr/bin/bash

echo "Update the ssh config with the disable root config"
sudo cp disable_root_login.conf /etc/ssh/sshd_config.d/

echo "Restart SSH Service"
sudo systemctl reload ssh
