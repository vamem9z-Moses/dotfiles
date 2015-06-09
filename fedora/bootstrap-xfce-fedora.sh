#!/usr/bin/env bash

echo "Install XFCE Desktop"
sudo dnf groupinstall -y "Xfce Desktop"

echo "Install Additional XFCE 4 apps and plugins"
sudo dnf install -y xarchiver xfburn xfce4-whiskermenu-plugin xfce4-volumed xfce4-mixer elementary-xfce-icon-theme.noarch

echo "Copy Compton Config - Compton is a compositor that eliminates tearing"
echo "You will have to download compton from the opensuse factory"
echo "Add compton -b to the autostart"
cp .compton.conf $HOME

echo "Ok we're done, you'll want to setup the theme with Greybird, elementary
icons and set the window decration in settings to Greybird as well. You'll also
want to check on autostart scripts to make sure none of the gnome services are starting
especially tracker which is a battery hog."
