# Setup wifi before running this script with nmcli
# run as user not root!

sudo pacman -Syu --noconfirm

# Stuff you need
sudo pacman -S git --noconfirm

# setup folders
mkdir ~/.local/share -p
mkdir ~/.config/ -p

# Install yay
cd ~/.local/share
git clone https://aur.archlinux.org/yay.git
cd ./yay
makepkg -si

# Graphical shit intel drivers
sudo pacman -S mesa libx11 xorg-server xorg-xinit libxrandr libxinerama libxft xorg-xrdb xf86-video-intel xorg-xrandr xorg-xclipboard unclutter --noconfirm

# Font
yay -S nerd-fonts-jetbrains-mono --noconfirm

# configs
cp ~/dotfiles/configs/* ~/.config/ -r
chmod +x ~/.config/ranger/scope.sh # needed for ranger

# ChadWM
sudo pacman -S xorg-xsetroot imlib2
cd ~/.config
git clone https://github.com/KlemensMaentele/chadwm --depth 1
cd ~/.config/chadwm/chadwm
sudo make install
mkdir -p ~/.local/share/fonts
cp ~/.config/chadwm/fonts/* ~/.local/share/fonts/

# Autostart
chmod +x ~/.config/chadwm/scripts/bar.sh ~/.config/chadwm/scripts/autostart
cp ~/dotfiles/.bash_profile ~/.bash_profile
cp ~/dotfiles/.xinitrc ~/.xinitrc


# ST terminal
cd ~/.config/
git clone https://github.com/KlemensMaentele/st
cd st
sudo make install
#sudo apt install ncurses-term # support for 256color on ssh

# install miscellaneous
yay -S brave-bin --noconfirm
sudo pacman -S mpv ranger neofetch tlp ueberzug --noconfirm
sudo systemctl enable tlp --now

# nvchad
sudo pacman -S neovim --noconfirm
mkdir -p ~/.config/nvim
cd ~/.config/nvim/
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
