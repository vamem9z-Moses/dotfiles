#!/usr/bin/env bash

echo "Create symbolic link for btsync"
sudo ln -s /opt/btsync/btsync /usr/local/bin

echo "Setup Systemd Service for user"
sudo cp btsync@.service /etc/systemd/system
sudo systemctl enable btsync@$USER

echo "Creating basic config"
mkdir -p $HOME/.config/btsync
btsync --dump-sample-config > $HOME/.config/btsync/btsync.json

echo "Done. Update $HOME/.config/btsync/btsync.json change the storage path to point to $HOME/.config/btsync and change the port if necessary"



