# Dotfiles
## Features
- Install script
- WM DWM (my ChadWM fork)
- ST as terminal (ChadST)
- SpaceVim as texteditor
- Zsh shell

## Installation
**Only run the installscript on a freshly installed machine**
- [X] tested on Archlinux
- [X] tested on Parabola

Clone the repository into ~/.config/dotfiles
```
mkdir -p ~/.config/dotfiles
git clone https://github.com/KlemensMaentele/dotfiles/ ~/.config/dotfiles
```
cd into the repository and run the installation script
```
cd ~/.config/dotfiles
bash install.sh
```
This should install a working version of my desktop

## Post installation configuring
### Autostart
When you login ~/.zprofile gets executed which start the x-server.
The x-server runs the ~/.xinitrc script which runs the ~/devel/scripts/system/autostart script.
Everything that you put into the autostart script will get executed after you login. Configure to your liking but keep dwm and the statusbar.
### Statusbar
There are two different statusbars. There is ~/devel/scripts/system/bar-laptop.sh which as the name suggests was made for laptops and there is ~/devel/scripts/system/bar-desktop.sh which was made for desktop PCs.
Both are pretty much the same but bar-laptop features battery and display brightness indicators.
By default bar-laptop.sh is used but if you want to use the desktop-bar replace the line
```
bash ~/devel/scripts/system/bar-laptop.sh &
```
with
```
bash ~/devel/scripts/system/bar-desktop.sh &
```
in the autostart script ~/devel/scripts/system/autostart.
### Global shortcuts
Global shortcuts are defined in the desktop managers config file located at ~/.config/chadwm/chadwm/config.h
The config.h file is in gitignore so your config will not get updated when pulling.
~/.config/chadwm/chadwm/config.def.h is the configuration that I use. Feel free to change it to your liking.
Because dwm's (the desktop manager) configurations are compiled into the binary you will need to recompile dwm after changing the config file.
So after changing config.h cd into ~/.config/chadwm/chadwm/ and recompile:
```
cd ~/.config/chadwm/chadwm/
sudo make install
```
To see your changes press ctrl + windows + q which will stop the desktop environment and type startx to start it again.
## Credits
- https://github.com/siduck/ for his chadwm and ST build
- https://github.com/LukeSmithxyz/voidrice for many configs and scripts
