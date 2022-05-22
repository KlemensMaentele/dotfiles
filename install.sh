#Setup wifi before running this script with nmcli
# run as user not root!

git config --global credential.helper store # Save github creds when typed in

installpkg(){ sudo pacman --noconfirm --needed -S "$1" ;}
installpkgaur() { sudo -u "$USER" yay -S --noconfirm "$1" ;}

printf "updateing the system......\n\n\n"
sudo pacman -Syu --noconfirm
echo "Done"

# Stuff you need
printf "Installing dependencies......\n\n\n"
installpkg "git"
installpkg "python-pip"
installpkg "man-db"
installpkg "pulsemixer"
installpkg "pamixer"
# setup folders
mkdir ~/.local/share/ -p
mkdir ~/.config/ 
mkdir ~/Music/
mkdir ~/devel/scripts/ -p
echo "Done"

# Install yay
printf "Installing yay aur helper......\n\n\n"
cd ~/.local/share
git clone https://aur.archlinux.org/yay.git
cd ./yay
makepkg -si --needed --noconfirm
echo "Done"

# Graphical shit intel drivers
printf "Installing xorg stuff......\n\n\n"
sudo pacman --noconfirm --needed -S mesa libx11 xorg-server xorg-xinit libxrandr libxinerama libxft xorg-xrdb xf86-video-intel xorg-xrandr xorg-xclipboard upower
echo "Done"

# Font
printf "Installing font......\n\n\n"
installpkgaur "nerd-fonts-jetbrains-mono"
echo "Done"

# configs
printf "Copying config files......\n\n\n"
cp ~/.config/dotfiles/configs/* ~/.config/ -r
cp ~/.config/dotfiles/scripts/* ~/devel/scripts/ -r # Copying scripts
chmod +x ~/.config/ranger/scope.sh # needed for ranger
chmod +x ~/.config/cmus/update-library.sh # needed for cmus update of music library
echo "Done"

# ranger
printf "Adding ranger plugins......\n\n\n"
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
echo "Done"

# ChadWM
printf "Installing DWM......\n\n\n"
sudo pacman --noconfirm --needed -S xorg-xsetroot imlib2
git clone https://github.com/KlemensMaentele/chadwm --depth 1 ~/.config/chadwm
cd ~/.config/chadwm/chadwm
sudo make install
mkdir -p ~/.local/share/fonts
cp ~/.config/chadwm/fonts/* ~/.local/share/fonts/
chmod +x ~/.config/chadwm/scripts/bar.sh ~/.config/chadwm/scripts/autostart
echo "Done"

# Autostart stuff
cp ~/.config/dotfiles/dotfiles/.* ~/

# ST terminal
printf "Installing the terminal......\n\n\n"
git clone https://github.com/siduck/st ~/.config/st 
cd ~/.config/st 
sudo make install 
#sudo apt install ncurses-term # support for 256color on ssh
echo "Done"

# install miscellaneous
printf "Installing Browser......\n\n\n"
installpkgaur "brave-bin"
echo "Done"

printf "Installing programs.....\n\n\n"
sudo pacman --noconfirm --needed -S sxiv mpv ranger neofetch tlp ueberzug feh cmus
sudo systemctl enable tlp --now
echo "Done"

# nvchad
printf "Installing neovim......\n\n\n"
installpkg "neovim"
git clone https://github.com/NvChad/NvChad --depth 1 ~/.config/nvim
nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
echo "Done"

# zsh todo add zshrc and zprofile to repo and copy them over , use zsh as standart shell
printf "Installing zshell......\n\n\n"
installpkg "zsh"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/zsh-syntax-highlighting
chsh -s /usr/bin/zsh $user # setting zsh as standart shell
rm ~/.bash_history ~/.bash_rc ~/.bash_profile #remove bash files we don't need anymore

printf "finished"
