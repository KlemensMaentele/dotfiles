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
sudo pacman -S --noconfirm --needed - < pkglist.txt
sudo systemctl enable tlp --now # For better energy management

# setup folders
mkdir ~/.local/share/ -p
mkdir ~/.config/ 
mkdir ~/Music/
mkdir ~/devel/scripts/ -p
mkdir ~/Pictures/wallpaper/ -p
echo "Done"

# Install yay
printf "Installing yay aur helper......\n\n\n"
cd ~/.local/share
git clone https://aur.archlinux.org/yay.git
cd ./yay
makepkg -si --needed --noconfirm
echo "Done"

# Font
printf "Installing font......\n\n\n"
installpkgaur "nerd-fonts-jetbrains-mono"
echo "Done"

# configs
printf "Copying config files......\n\n\n"
cp ~/.config/dotfiles/configs/* ~/.config/ -r
cp ~/.config/dotfiles/scripts/* ~/devel/scripts/ -r # Copying scripts
echo "Done"

# ranger
printf "Adding ranger plugins......\n\n\n"
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
echo "Done"

# ChadWM
printf "Installing DWM......\n\n\n"
git clone https://github.com/KlemensMaentele/chadwm --depth 1 ~/.config/chadwm
cd ~/.config/chadwm/chadwm
sudo make install
mkdir -p ~/.local/share/fonts
cp ~/.config/chadwm/fonts/* ~/.local/share/fonts/
chmod +x ~/.config/chadwm/scripts/bar.sh ~/.config/chadwm/scripts/autostart
echo "Done"

# Autostart stuff
cp ~/.config/dotfiles/dotfiles/.* ~/
mv ~/.Xmodmap ~/.config/.Xmodmap
mv ~/.Xresources ~/.config/.Xresources
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


# SpaceVim
printf "Installing neovim......\n\n\n"
curl -sLf https://spacevim.org/install.sh | bash
echo "Done"

# zsh todo add zshrc and zprofile to repo and copy them over , use zsh as standart shell
printf "Installing zshell......\n\n\n"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/zsh-syntax-highlighting
chsh -s /usr/bin/zsh $user # setting zsh as standart shell
rm ~/.bash_history ~/.bash_rc ~/.bash_profile #remove bash files we don't need anymore

printf "finished"
