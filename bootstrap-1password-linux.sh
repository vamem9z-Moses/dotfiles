#!/usr/bin/env bash

# Set kernel.yama.ptrace_scope=1 to allow for file dialogs to work correctly in 1Password
echo "kernel.yama.ptrace_scope=1" | sudo tee -a /etc/sysctl.d/99-ptrace-scope.conf
sudo sysctl --system

# Add silent 1Password start up
./bootstrap-1password-silent.sh
