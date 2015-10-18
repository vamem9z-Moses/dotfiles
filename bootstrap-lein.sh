#!/usr/bin/env bash

echo "Setup lein profiles"
mv $HOME/lein/profiles.clj $HOME/lein/profiles.clj.bak
mkdir $HOME/.lein
ln -s $PWD/lein/profiles.clj $HOME/.lein/profiles.clj
