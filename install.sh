# Clone repo into .config/dotfiles
# Setup wifi before running this script with nmcli
# run as user not root!

if [[ $EUID == 0 ]] # check if user is running script as root
then
  echo "Don't run the script as root user"
  exit
fi

git config --global credential.helper store # Save github creds when typed in

installpkgaur() { sudo -u "$USER" yay -S --noconfirm "$1" ;} # function for installing packets via the aur

printf "updateing the system......\n\n\n"
sudo pacman -Syu --noconfirm
echo "Done"

# Stuff you need
printf "Installing dependencies......\n\n\n"
sudo pacman -S --noconfirm --needed - < pkglist.txt

# Services you'll want
sudo systemctl enable tlp --now # For better power management and longer battery runtime
sudo systemctl enable cups --now # For printing support
sudo systemctl enable ipp-usb --now # For usb scanner connection support

# setup folders
mkdir ~/.local/share/ -p 
mkdir ~/Music/
mkdir ~/devel/scripts/ -p
mkdir ~/Pictures/wallpaper/ -p
mkdir ~/Pictures/Screenshots/ -p
mkdir ~/.npm-global
echo "Done"

# Install yay
printf "Installing yay aur helper......\n\n\n"
git clone https://aur.archlinux.org/yay.git ~/.local/share/yay
cd ~/.local/share/yay
makepkg -si --needed --noconfirm
echo "Done"

# configs
printf "Copying config files......\n\n\n"
cp ~/.config/dotfiles/configs/* ~/.config/ -r # Copying configs
cp ~/.config/dotfiles/configs/.* ~/.config/ -r # Copying configs
cp ~/.config/dotfiles/scripts/* ~/devel/scripts/ -r # Copying scripts
cp ~/.config/dotfiles/wallpaper/* ~/Pictures/wallpaper # Copy wallpapers
echo "Done"

# ChadWM
printf "Installing DWM......\n\n\n"
git clone https://github.com/KlemensMaentele/chadwm --depth 1 ~/.config/chadwm
cd ~/.config/chadwm/chadwm
sudo make install
mkdir -p ~/.local/share/fonts
cp ~/.config/chadwm/fonts/* ~/.local/share/fonts/
echo "Done"

# Autostart stuff
cp ~/.config/dotfiles/dotfiles/.* ~/ # copy over dotfiles
cp ~/.config/dotfiles/wallpaper/Cliffs\ of\ the\ Porte\ d\'Aval.png ~/Pictures/wallpaper/wall.png

# ST terminal
printf "Installing the terminal......\n\n\n"
git clone https://github.com/siduck/st ~/.config/st 
cd ~/.config/st 
sudo make install 
echo "Done"

# install browser 
printf "Installing Browser......\n\n\n"
installpkgaur "brave-bin"
echo "Done"

# install filebrowser
printf "Installing lf......\n\n\n"
installpkgaur "lf-bin"
echo "Done"

# install zsh plugins
printf "Installing zshell......\n\n\n"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/zsh-syntax-highlighting
chsh -s /usr/bin/zsh $user # setting zsh as standart shell
rm ~/.bash_history ~/.bash_rc ~/.bash_profile #remove bash files we don't need anymore

printf "finished"
