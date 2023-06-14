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
LOGOS="$HOME/.local/share/logos/"
BINS="/usr/local/bin/"
GITHUB="git config --global"


printf "\n\n[$] > Updating system packages...\n\n"
$INST -Syu


printf "\n\n[$] > Installing libraries...\n\n"
$INST -S linux linux-firmware linux-headers intel-ucode nvidia
$INST -S xorg-server xorg-server-common xorg-xrandr xorg-xinit
printf "\n\n[$] > Installing utilities...\n\n"
$INST -S xclip xcolor feh papirus-icon-theme wget curl tree hacksaw man-db
$INST -S pipewire pipewire-pulse pipewire-media-session unzip unrar shotgun
printf "\n\n[$] > Installing applications...\n\n"
$INST -S qtile picom rofi alacritty neovim zathura zathura-pdf-poppler
$INST -S rtorrent ranger obsidian neofetch fzf polybar dunst systemd-resolvconf
printf "\n\n[$] > Installing programming languages...\n\n"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --profile default -y
$INST -S python gcc


printf "\n\n[$] > Creating folders...\n\n"
mkdir -p "$CONFIG" "$FONT"
mkdir -p "$CONFIG" "$LOGOS"
mkdir $HOME/Downloads
mkdir $HOME/Projects
mkdir $HOME/Notes
mkdir $HOME/Media


printf "\n\n[$] > Copying config files...\n\n"
cp -r "$PWD/font/"* "$FONT"
cp -r "$PWD/logos/"* "$LOGOS"
cp -r "$PWD/src/"* "$CONFIG"
cp -r "$PWD/shell/".[^.]* "$HOME"
sudo cp -r "$PWD/xorgs/"* "/etc/X11/xorg.conf.d/"
$GITHUB user.email fidelicura@gmail.com
$GITHUB user.name fidelicura
$GITHUB credential.helper store
$GITHUB http.postBuffer 157286400


printf "\n\n[$] > Deleting unnecessary files...\n\n"
shopt -s extglob
sudo bash -c 'cd /usr/share/applications && rm -v !("Alacritty.desktop"|"brave-browser.desktop"|"obsidian.desktop"|"org.pwmt.zathura.desktop"|"xcolor.desktop")'
shopt -u extglob


printf "\n\n[$] > Updating system packages...\n\n"
$INST -Syu


printf "\n\n[$] > Clearing cache of packages...\n\n"
sudo pacman --noconfirm -Sc


printf "\n\n[$] > Done! Thanks for installing.\n"
printf "[$] > Do not forget to reboot your system after this installation!\n"
printf "[$] > Any questions/suggestions, you're welcome: https://github.com/fidelicura\n"
printf "[$] > Have a productive day!\n"
sudo reboot
