#!/usr/bin/env bash

echo "Install HTML and CSS Packages"
apm install emmet html-outliner

echo "Install Go Packages"
apm install go-plus go-debug go-oracle go-outline

echo "Install Vim Packages"
apm install vim-mode-plus vim-mode-plus-ex-mode

echo "Install Terminal Packages"
apm install term3 platformio-ide-terminal

echo "Install Tree Packages"
apm install tree-view-git-status logo-file-icons

echo "Install Git Packages"
apm install git-plus

echo "Install Code Cleanup Packages"
apm install atom-beautify

echo "Install General Packages"
apm install project-manager open-recent todo-show hyperclick multi-cursor

echo "Install File Navigation Packages"
apm install synced-sidebar minimap minimap-pigments pigments minimap-split-diff split-diff minimap-highlight-selected highlight-selected

echo "Install Additional JS Support"
apm install language-babel atom-ternjs linter linter-eslint linter-stylelint

echo "Install RiotJS Support"
apm install language-riot-tag

echo "Install Typscript Support"
apm install atom-typescript

echo "Install Python Support"
# TODO: Install Virtualenv when support for 1.7.4 is ready
apm install python-debugger autocomplete-python atom-python-test

echo "Install Nim Support"
apm install nim language-nim

echo "Install Powershell Support"
apm install language-powershell

echo "Copy atom config files"
cp ./atom/* $HOME/.atom
