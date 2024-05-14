#!/bin/sh

echo "Install samba and its dependencies"
echo " "
# avahi and wsdd are required for the server to show up in windows file browser
sudo dnf install samba avahi wsdd
