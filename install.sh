#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

# Making .config and moving config files
cd $builddir
mkdir -p /home/$username/.config
cp .vimrc /home/$username/
cp -R dotconfig/* /home/$username/.config/
chown -R $username:$username /home/$username

# Installing Programs 
pacman -Syu
pacman -S install i3 xorg unzip wget pulseaudio pavucontrol base-devel curl nemo \
flameshot lightdm lightdm-gtk-greeter telegram-desktop gnu-free-fonts ttf-font-awesome \
ttf-jetbrains-mono-nerd ttf-liberation firefox lxappearance zsh eog evince \
vlc bat xclip brightnessctl playerctl nitrogen alsa-utils \
xournalpp blueman gvim cronie dunst eza

# Enable graphical login and change target from CLI to GUI
# systemctl enable lightdm

# Enable click on tap and scroll with two fingers
# /etc/X11/xorg.conf.d/50-libinput.conf
#
# Section "InputClass"
#         Identifier "libinput touchpad catchall"
#         MatchIsTouchpad "on"
#         MatchDevicePath "/dev/input/event*"
#         Driver "libinput"
#         Option "Tapping" "on"
#         Option "DisableWhileTyping" "on"
#         #Option "ScrollMethod" "edge"
# EndSection
# 
# Section "InputClass"
#         Identifier "touchpad ignore duplicates"
#         MatchIsTouchpad "on"
#         MatchOS "Linux"
#         MatchDevicePath "/dev/input/mouse*"
#         Option "Ignore" "on"
# 	Option "VertTwoFingerScroll" "on"
# EndSection

# systemctl previleges
# into /etc/sudoers.d/sysctl
# alls ALL = NOPASSWD: /bin/systemctl

# Set zsh default shell
# chsh -s $(which zsh)
# Clone the following plugins into the folder plugins, in .config/zsh
# https://github.com/zsh-users/zsh-autosuggestions
# https://github.com/zsh-users/zsh-syntax-highlighting

# Install vscode(paste settings and keybindings in dotconfig/Code/User)

# Enable default user and background image in lightdm
# 1)In /etc/lightdm/lightdm.conf
#   Go down the file until you get to:
#   # greeter-hide-users=false
#   Un-comment it, make sure the value is false.
# 2)In /etc/lightdm/lightdm-gtk-greeter.conf
#   Go down the file until you get to:
#   [greeter]
#   background=/usr/share/pixmaps/Black_Hole_Wallpaper.jpeg

# Notification of low battery
# make scripts executable
# in arch enable crontab that is renamed with cronie
# systemctl enable cronie
# systemctl start cronie
# crontab -e
# append:
# * * * * * XDG_RUNTIME_DIR=/run/user/$(id -u) /home/alls/scripts/batwarn.sh

# Install chrome with yay. Extensions:
#   adblock plus
#   dark reader
#   deepl traslate
#   video speed controller
#   rearrange tabs
