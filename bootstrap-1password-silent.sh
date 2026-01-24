#/usr/bin/env bash

echo "Setup 1password so that there is an option to have it start siliently on start up"

echo "Copy Silent App Definition to local"

cp 1password/1password-silent.desktop $HOME/.local/share/applications
