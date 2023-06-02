#!/bin/bash



clear
printf "[$] > Welcome!\n"
printf "[$] > Installer will update your system before installation.\n"
printf "[$] > Installer will change gitconfig file.\n"
printf "[$] > Installer will clear package manager cache.\n"
printf "[$] > If you are OK with this, confirm with your password.\n"
sudo printf "[$] > Installation started!"


printf "\n\n[$] > Creating temporary shell variables...\n\n"
INST="sudo pacman --needed --noconfirm"
CONFIG="$HOME/.config/"
FONT="$HOME/.local/share/fonts/"
BINS="/usr/local/bin/"
GITHUB="git config --global"


printf "\n\n[$] > Updating system packages...\n\n"
$INST -Syu


printf "\n\n[$] > Installing libraries...\n\n"
$INST -S fuse2 nvidia intel-ucode
$INST -S xorg-server xorg-server-common xorg-xrandr xorg-xinit
printf "\n\n[$] > Installing utilities...\n\n"
$INST -S xclip xcolor feh papirus-icon-theme wget curl tree hacksaw
$INST -S pipewire pipewire-pulse pipewire-media-session unzip unrar shotgun
printf "\n\n[$] > Installing applications...\n\n"
$INST -S qtile picom rofi alacritty neovim zathura zathura-pdf-poppler
$INST -S firefox rtorrent ranger obsidian neofetch lutris
printf "\n\n[$] > Installing programming languages...\n\n"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --profile default -y
$INST -S python gcc


printf "\n\n[$] > Creating folders...\n\n"
mkdir -p "$CONFIG" "$FONT"
mkdir $HOME/Screenshots
mkdir $HOME/Downloads
mkdir $HOME/Projects
mkdir $HOME/Books
mkdir $HOME/Notes
mkdir $HOME/Games
mkdir $HOME/Games/Instances
mkdir $HOME/Games/Lutrisenses


printf "\n\n[$] > Copying config files...\n\n"
cp -r "$PWD/font/"* "$FONT"
cp -r "$PWD/src/"* "$CONFIG"
cp -r "$PWD/shell/".[^.]* "$HOME"
sudo cp -r "$PWD/xorgs/"* "/etc/X11/xorg.conf.d/"
$GITHUB user.email fidelicura@gmail.com
$GITHUB user.name fidelicura
$GITHUB credential.helper store
$GITHUB http.postBuffer 157286400


printf "\n\n[$] > Updating system packages...\n\n"
$INST -Syu


printf "\n\n[$] > Clearing cache of packages...\n\n"
sudo pacman --noconfirm -Sc


printf "\n\n[$] > Done! Thanks for installing.\n"
printf "[$] > Do not forget to reboot your system after this installation!\n"
printf "[$] > Any questions/suggestions, you're welcome: https://github.com/fidelicura\n"
printf "[$] > Have a productive day!\n"
sudo reboot
