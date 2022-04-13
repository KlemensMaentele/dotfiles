# before running this script make sure that your are not ahead of any repos and that all repos are where they are suppost to be
fetchandpull() {
  git fetch
  git pull
}
yay -Syu

# updateing the dotfile repo
cd ~/.config/dotfiles
fetchandpull

# update configs and scripts
cp ~/.config/dotfiles/configs/* ~/.config/ -r
cp ~/.config/dotfiles/scripts/* ~/devel/scripts/ -r
chmod +x ~/.config/ranger/scope.sh
chmod +x ~/.config/cmus/update-library.sh

# updating ranger icon plugin
cd ~/.config/ranger/plugins/ranger_devicons~/
fetchandpull

# updating DWM
cd ~/.config/chadwm/ 
fetchandpull
cd ~/.config/chadwm/chadwm/
sudo make install
cp ~/.config/chadwm/fonts/* ~/.local/share/fonts/

# updating dotfile stuff
cp ~/.config/dotfiles/dotfiles/* ~/

# updating terminal
cd ~/.config/st/
fetchandpull
sudo make install

#updating zshell
cd ~/.config/zsh/zsh-autosuggestions/
fetchandpull
cd ~/.config/zsh/zsh-syntax-highlighting/
fetchandpull

echo "To update neovim: open neovim and type space + uu"
