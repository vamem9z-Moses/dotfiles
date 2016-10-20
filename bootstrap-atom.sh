#!/usr/bin/env bash

echo "Install HTML and CSS Packages"
apm install emmet

echo "Install Go Packages"
apm install go-plus go-debug go-oracle

echo "Install Vim Packages"
apm install ex-mode vim-mode

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
apm install language-babel atom-ternjs linter linter-eslint

echo "Install RiotJS Support"
apm install language-riot-tag

echo "Install Typscript Support"
apm install atom-typescript

echo "Install Python Support"
# TODO: Install Virtualenv when support for 1.7.4 is ready
apm install python-debugger autocomplete-python atom-python-test

echo "Install Nim Support"
apm install nim language-nim
