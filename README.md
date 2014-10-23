# Dotfiles

These are my key dotfiles. The current configuration assumes Ubuntu 14.04
(specifically Xubuntu 14.04).

## Bootstrapping

There are 3 bootstrap scripts. The first is bootstrap-workstation.sh it will
take a fresh ubuntu/xubuntu 14.04 install and set it up to my specifications
favorite apps extra.  It will ask for user input 3 times during the first
apt-get update, when mscorefonts installs and when the shell change program
runs.

The second script bootstrap-thinkpad.sh runs bootstrap-workstation.sh and adds
additional thinkpad specific libraries.  The last is boostrap vim it setups up vim and zsh to my specifications.  It
requires the following (these depenedencies are in the boostrap-workstations.sh
script):

### Setup Vim

To use you'll want to install the following:

1. Vim
1. oh-my-zsh
1. zsh
1. virtualenv
1. konsole - set as default terminal
1. golang
1. nsf/gocode in the src directory of any golang workspaces
1. git
1. sbcl

In addition, there are a few prerequisites for the vim
configuration:

1. ctags
1. CMake and the python libraries 2.7+ (libpython2.7-dev) for YouCompleteMe
1. pysmell

You'll also want to make sure that the Markdown.pl file is in ~/bin or change
its location in .vimrc.  My bin repo has the Markdown.pl file in it.

Once these are installed you'll want to run the bootstrap-vim.sh script, which will
backup your current dotfiles and replace them with those in this repo.

#### Slimv

To make slimv work correctly you'll need to adsf installed.  The easiest way to
do this is to install quicklisp and run `(ql:add-to-init-file)` to ensure that
it loads whenever the REPL loads. See http://www.quicklisp.org/ for more info.

## Postinstall

Occasionally you'll want to run the rvm-pythonz-update.sh script to update
those 2 to the latest versions.

## Grub Configuration

For thinkpads you'll want to add the following line to your grub configuration
on ubuntu it is /etc/default/grub, be sure to rerun update-grub afterwards:
'GRUB_CMDLINE_LINUX_DEFAULT="quiet splash thinkpad-acpi.brightness_enable=1 acpi_backlight=vendor i915.i915_enable_rc6=1 i915.i915_enable_fbc=1 i915.lvds_downclock=1 i915.semaphores=1 intel_pstate=enable pcie_aspm=
force"'

