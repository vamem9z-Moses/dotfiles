#!/usr/bin/env sh

echo "Add repos to debian.sources"
sudo cp $PWD/debian.sources /etc/apt/sources.list.d/debian.sources

if [ -f /etc/apt/sources.list ]; then
  echo "Remove sources.lit in favor of debian.sources"  
  sudo rm /etc/apt/sources.list
fi