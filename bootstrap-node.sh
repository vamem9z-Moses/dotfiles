#!/bin/sh

echo "Bootstrap NodeJs to use local global directory"
mkdir $HOME/.npm-global
npm config set prefix $HOME/.npm-global

