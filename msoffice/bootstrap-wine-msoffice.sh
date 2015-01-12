#!/usr/bin/env bash

echo "Copy icon files for desktop entries"
cp -R Office07 $HOME/.local/share/icons

echo "Copy desktop entries for MS Office"
cp desktop/*.desktop $HOME/.local/share/applications
