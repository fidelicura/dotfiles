#!/bin/bash



clear
printf "[$] > Welcome!\n"
printf "[$] > Installer will update your system before installation.\n"
printf "[$] > Installer will change gitconfig file.\n"
printf "[$] > Installer will clear package manager cache.\n"
printf "[$] > If you are OK with this, confirm with your password.\n"
sudo printf "[$] > Installation started!"


printf "\n\n[$] > Creating temporary shell variables...\n\n"
INST="sudo pacman --noconfirm"
CONFIG="$HOME/.config/"
FONT="$HOME/.local/share/fonts/"
BINS="/usr/local/bin/"
GITHUB="git config --global"


printf "\n\n[$] > Updating system packages...\n\n"
$INST -Syu


printf "\n\n[$] > Installing libraries...\n\n"
$INST -S unzip unrar xclip xorg xorg-xinit xorg-xdm fuse2 tree nvidia base-devel
printf "\n\n[$] > Installing utilities...\n\n"
$INST -S xcolor feh fzf flameshot papirus-icon-theme ranger 
printf "\n\n[$] > Installing applications...\n\n"
$INST -S qtile picom rofi alacritty neovim zathura zathura-pdf-poppler firefox telegram-desktop discord qbittorrent 
printf "\n\n[$] > Installing programming languages...\n\n"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --profile default -y
$INST -S python gcc


printf "\n\n[$] > Creating folders...\n\n"
mkdir -p "$CONFIG" "$FONT"


printf "\n\n[$] > Copying config files...\n\n"
cp -r "$PWD/font/"* "$FONT"
cp -r "$PWD/src/"* "$CONFIG"
cp -r "$PWD/shell/".[^.]* "$HOME"
sudo cp -r "$PWD/fetcher/"* "$BINS"
$GITHUB user.email fidelicura@gmail.com
$GITHUB user.name fidelicura
$GITHUB credential.helper store


printf "\n\n[$] > Clearing cache of packages...\n\n"
sudo pacman --noconfirm -Sc


printf "\n\n[$] > Done! Thanks for installing.\n"
printf "[$] > Any questions/suggestions, you're welcome: https://github.com/qoopdata\n"
printf "[$] > Have a productive day!\n"
