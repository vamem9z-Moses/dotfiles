#!/usr/bin/env bash

echo "Upgrade RVM and Pythonz and NVM to latest stable version"
rvm get stable
pythonz update
cd $HOME/.nvm
git pull origin master
