# Setup wifi before running this script with nmcli
# run as user not root!
# Notes : Try nvChad


sudo pacman -Syu

# Stuff you need
sudo pacman -S git python-pip

# setup folders
mkdir ~/.local/share -p
mkdir ~/.config/ -p

# Install yay
cd ~/.local/share
git clone https://aur.archlinux.org/yay.git
cd ./yay
makepkg -si

# Graphical shit intel drivers
sudo pacman -S mesa libx11 xorg-server xorg-xinit libxrandr libxinerama libxft xorg-xrdb xf86-video-intel xorg-xrandr xorg-xclipboard unclutter

# Font
yay -S nerd-fonts-jetbrains-mono

# configs
cp ~/dotfiles/configs/* ~/.config/ -r

# ChadWM
sudo pacman -S xorg-xsetroot imlib2
cd ~/.config
git clone https://github.com/KlemensMaentele/chadwm --depth 1
cd ~/.config/chadwm/chadwm
sudo make install
#copy fonts

# ST terminal
cd ~/.config/
git clone https://github.com/KlemensMaentele/st
cd st
sudo make install

# install miscellaneous
yay -S brave-bin
sudo pacman -S mpv ranger neofetch tlp
sudo systemctl enable tlp --now
