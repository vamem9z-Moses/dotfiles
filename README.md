# Dotfiles

These are my key dotfiles. The current configuration assumes Ubuntu 14.04
(specifically Xubuntu 14.04).

## Bootstrapping

### Boostrap Workstation
There are scripts to bootstrap Fedora 21 with either GNOME or XFCE and Xubuntu
14.04.

#### Bootstrap Xubuntu
There are 3 bootstrap scripts. The first is `bootstrap-workstation.sh` it will
take a fresh ubuntu/xubuntu 14.04 install and set it up to my specifications
favorite apps extra.  It will ask for user input 3 times during the first
apt-get update, when mscorefonts installs and when the shell change program
runs.

The second script `bootstrap-thinkpad.sh` runs `bootstrap-workstation.sh` and adds
additional thinkpad specific libraries.

#### Boostrap Fedora
To setup fedora you'll want to use the following scripts:

1. `bootstrap-fedora-workstation.sh` - Basic workstation configuration
   independent of DE.
1. `boostrap-ctags.sh` - Used by the boostraps-fedora-workstation.sh script to
   add golang support to ctags under F21. May not be needed in the future.  Fedora it uses an older version of ctags 5.8 vs the git commit for 5.9 that doesn't have support for go you need to run the boostrap-ctags.sh
  `./boostrap-ctag.sh`. This will copy a ctags file that adds go bindings.
1. `boostrap-xfce-fedora.sh` - Setup F21 to use XFCE. This should be run after
   boostrap-fedora-workstation.sh.
1. `bootstrap-btsync.sh` - This will create the btsync systemd service for the
   user that runs the script.
1. `bootstrap-fonts` - This will add additional fonts to system. Right now it
   only adds the Monaco font.

### Bootstrap The Shell
`boostrap-shell.sh` will setup the shell with zsh, rvm, pythonz and nvm. This
should be run after the workstation bootstrap script for either fedora or
ubuntu.

### Bootstrap Vim
`bootstrap-vim.sh` should be run after the appropriate workstation bootstrap
script and optionally after the shell bootstrap script.

It setups up vim and zsh to my specifications.  It requires the following
(these dependencies are installed by the workstation scripts):

To use you'll want to install the following:

1. Vim
1. oh-my-zsh
1. zsh
1. virtualenv
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

## MS Office in Wine
Office 2007 is installed in wine the `msoffice/bootstrap-wine-msoffice.sh`
script will add icon and desktop files so that office will show up in the DE's
Menu.

## Postinstall and Updating

Occasionally you'll want to run the `rvm-pythonz-nvm-update.sh` script to update
those 2 to their latest versions. There is also a script to update all of the vim
plugins it is `update-vim.sh`.

## Grub Configuration

For thinkpads you'll want to add the following line to your grub configuration
on ubuntu it is /etc/default/grub, be sure to rerun update-grub afterwards:'GRUB_CMDLINE_LINUX_DEFAULT="quiet splash thinkpad-acpi.brightness_enable=1 acpi_backlight=vendor i915.i915_enable_rc6=1 i915.i915_enable_fbc=1 i915.lvds_downclock=1 i915.semaphores=1 intel_pstate=enable pcie_aspm=
force"'

For all other computers use this line: `GRUB_CMDLINE_LINUX_DEFAULT="quiet splash pcie_aspm=force acpi_osi='!Windows 2012' acpi=force acpi_enforce_resources=lax i915.i915_enable_rc6=1 i915.i915_enable_fbc=1 i9
15.lvds_downclock=1 i915.semaphores=1 drm.vblankoffdelay=1 acpi_backlight=vendor`

For computers with kernels 3.15+ the setting should look like this: pcie_aspm=force acpi_osi=Linux acpi=force acpi_enforce_resources=lax i915.enable_rc6=1 i915.enable_fbc=1 i915.lvds_downclock=1 i915.semaphores=1 drm.vblankoffdelay=1"

Haswell and newer computers can add the following i915.enable_psr=1 to enable
Panel Self Refresh.

Sandy Bridge and Ivy Bridge can use i915.enable_rc6=7 instead of
i915.enable_rc=1 to enable lower rc6 states that only exist on those processors.
