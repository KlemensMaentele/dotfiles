# Setup wifi before running this script with nmcli
# run as user not root!

git config --global credential.helper store # Save github creds when typed in

installpkg(){ sudo pacman --noconfirm --needed -S "$1" >/dev/null 2>&1 ;}
installpkgaur() { sudo -u "$USER" yay -S --noconfirm "$1" >/dev/null 2>&1 ;}

echo -n "updateing the system......"
sudo pacman -Syu --noconfirm >/dev/null 2>&1
echo "Done"

# Stuff you need
installpkg "git"

# setup folders
mkdir ~/.local/share -p
mkdir ~/.config/ -p

# Install yay
echo -n "Installing yay aur helper......"
cd ~/.local/share
git clone https://aur.archlinux.org/yay.git
cd ./yay
makepkg -si --needed --noconfirm >/dev/null 2>&1
echo "Done"

# Graphical shit intel drivers
echo -n "Installing xorg stuff......"
sudo pacman --noconfirm --needed -S mesa libx11 xorg-server xorg-xinit libxrandr libxinerama libxft xorg-xrdb xf86-video-intel xorg-xrandr xorg-xclipboard unclutter >/dev/null 2>&1
echo "Done"

# Font
echo -n "Installing font......"
installpkgaur "nerd-fonts-jetbrains-mono"
echo "Done"

# configs
echo -n "Copying config files......"
cp ~/dotfiles/configs/* ~/.config/ -r
chmod +x ~/.config/ranger/scope.sh # needed for ranger
echo "Done"

# ChadWM
echo -n "Installing DWM......"
sudo pacman --noconfirm --needed -S xorg-xsetroot imlib2 >/dev/null 2>&1
cd ~/.config
git clone https://github.com/KlemensMaentele/chadwm --depth 1
cd ~/.config/chadwm/chadwm
sudo make install >/dev/null 2>&1
mkdir -p ~/.local/share/fonts
cp ~/.config/chadwm/fonts/* ~/.local/share/fonts/
echo "Done"

# Autostart
chmod +x ~/.config/chadwm/scripts/bar.sh ~/.config/chadwm/scripts/autostart
cp ~/dotfiles/.bash_profile ~/.bash_profile
cp ~/dotfiles/.xinitrc ~/.xinitrc


# ST terminal
echo -n "Installing the terminal......"
cd ~/.config/
git clone https://github.com/KlemensMaentele/st
cd st
sudo make install >/dev/null 2>&1
#sudo apt install ncurses-term # support for 256color on ssh
echo "Done"

# install miscellaneous
echo -n "Installing Browser......"
installpkgaur "brave-bin"
echo "Done"

echo -n "Installing programs (mpv, ranger, tlp, ueberzug)....."
sudo pacman --noconfirm --needed -S mpv ranger neofetch tlp ueberzug >/dev/null 2>&1
sudo systemctl enable tlp --now
echo "Done"

# nvchad
echo -n "Installing neovim......"
installpkg "neovim"
mkdir -p ~/.config/nvim
cd ~/.config/nvim/
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
echo "Done"
