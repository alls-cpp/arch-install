#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

# Update packages list and update system
apt update
apt upgrade -y

# Making .config and moving config files
cd $builddir
mkdir -p /home/$username/.config
cp .vimrc /home/$username/
cp -R dotconfig/* /home/$username/.config/
chown -R $username:$username /home/$username

# Installing Programs 
apt install i3 xorg unzip wget pulseaudio pavucontrol build-essential curl nemo \
chromium neofetch flameshot lightdm telegram-desktop fd-find fonts-font-awesome \
lxappearance papirus-icon-theme zsh eog evince vlc suckless-tools bat xclip \
brightnessctl playerctl i3blocks nitrogen network-manager network-manager-gnome xournalpp blueman -y

# Enable graphical login and change target from CLI to GUI
systemctl enable lightdm
systemctl set-default graphical.target

# if wifi problem
# into /etc/sudoers.d/sysctl
# alls ALL = NOPASSWD: /bin/systemctl

# Set zsh default shell
# chsh -s $(which zsh)

# Install eza, fzf, neovim, alacritty, vscode(paste settings and keybindings in dotconfig/Code/User)
# for fzf
# Do you want to enable fuzzy auto-completion? No
# Do you want to enable key bindings? Yes
# Do you want to update your shell configuration files? Yes

# Enable default user and background image in lightdm
# 1)In /etc/lightdm/lightdm.conf
#   Go down the file until you get to:
#   # greeter-hide-users=false
#   Un-comment it, make sure the value is false.
# 2)In /etc/lightdm/lightdm-gtk-greeter.conf
#   Go down the file until you get to:
#   [greeter]
#   background=/usr/share/pixmaps/Black_Hole_Wallpaper.jpeg

# Install jetbrainsmono font on https://www.nerdfonts.com/font-downloads, unzip it in ~/.fonts and run fc-cache -fv
# fc-list to see the available fonts

# Notification of low battery
# make scripts executable
# crontab -e
# append:
#   DISPLAY=:0
#   */2 * * * * /home/alls/scripts/batwarn.sh

# chrome extensions:
# adblock plus
# dark reader
# deepl traslate
# video speed controller
# rearrange tabs
