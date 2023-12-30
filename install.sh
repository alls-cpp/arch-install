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

# Install nala
apt install nala -y

# Making .config and moving config files
cd $builddir
mkdir -p /home/$username/.config
cp -R dotconfig/* /home/$username/.config/
chown -R $username:$username /home/$username

# Installing Programs 
nala install i3 xorg kitty unzip wget pulseaudio pavucontrol build-essential curl nemo \
chromium neofetch flameshot lightdm telegram-desktop fd-find fzf fonts-jetbrains-mono fonts-font-awesome \
lxappearance papirus-icon-theme zsh eog evince vlc suckless-tools bat xclip brightnessctl playerctl i3blocks -y

# Enable graphical login and change target from CLI to GUI
systemctl enable lightdm
systemctl set-default graphical.target


# Set zsh default shell

# Install eza

# Enable default user in lightdm
# In /etc/lightdm/lightdm.conf
# Go down the file until you get to:
# # greeter-hide-users=false
# Un-comment it, make sure the value is false.

