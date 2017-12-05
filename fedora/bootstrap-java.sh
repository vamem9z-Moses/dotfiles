#/usr/inb/env bash

echo "Install Java Development Dependencies"
sudo dnf install -y maven java-1.8.0-openjdk java-1.8.0-openjdk-devel java-1.8.0-openjdk-src java-1.8.0-openjdk-javadoc java-1.8.0-openjdk-headless

echo "Install Java 9 Development Dependencies"
sudo dnf install java-9* --exclude=*debug*

echo "Copy Icon to local applications diretory"
mkdir $HOME/.local/share/icons
cp ./eclipseicon.xpm $HOME/.local/share/icons

echo "Copy desktop to local application directory"
cp ./eclipse.desktop $HOME/.local/share/applications

echo "Be sure to create a symbolic link between the eclipse executable and the $/HOME/bin directory e.g. ln -s ~/Apps/eclipse/eclipse ~/bin"
