#!/usr/bin/env sh

echo "Copy Kitty Config Files to kitty directory"

mkdir -p $HOME/.config/kitty/
cp ./kitty/* $HOME/.config/kitty/

echo "Kitty is configured"
