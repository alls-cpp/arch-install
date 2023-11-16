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

# Making .config and moving config files and background to Pictures
cd $builddir
mkdir -p /home/$username/.config
mkdir -p /home/$username/Pictures/backgrounds
cp -R dotconfig/* /home/$username/.config/
cp backgrounds/* /home/$username/Pictures/backgrounds/
chown -R $username:$username /home/$username

# Installing Programs 
nala install i3 xorg feh kitty picom nitrogen unzip wget pulseaudio pavucontrol build-essential \
chromium neofetch flameshot fonts-jetbrains-mono lightdm bluetoothctl -y

# Enable graphical login and change target from CLI to GUI
systemctl enable lightdm
systemctl set-default graphical.target

