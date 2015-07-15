#/usr/inb/env bash

echo "Install Java Development Dependencies"
sudo dnf install -y maven java-1.8.0-openjdk java-1.8.0-openjdk-devel java-1.8.0-openjdk-src java-1.8.0-openjdk-javadoc java-1.8.0-openjdk-headless

echo "Copy Icon to local applications diretory"
cp ./eclipseicon.xpm $HOME/.local/share/icons

echo "Copy desktop to local application directory"
cp ./eclipse.desktop $HOME/.local/share/applications
