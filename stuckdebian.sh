#!/bin/bash

#################################  APPEARANCE  & DESKTOP   ###################################################

# Clone Repo & Rename Folder -- IMPORTANT - when you make it public eventually, change to HTML instead of SSH
#mv Termux-i3---Starlike-Mobile-Desktop Starlike

# Make Scripts Executable Without ./x.sh  & Move to System Bin
cd scripts
chmod +x cp2menu debian killi3 op opf prun pruns starti3 zrun zrunhud
cd
find ~/Starlike/scripts -type f -print0 | xargs -0 mv -t $PREFIX/bin

# Move Launchers & Fonts to System Directories
find ~/Starlike/programs -type f -print0 | xargs -0 mv -t $PREFIX/share/applications
find ~/Starlike/Fonts -type f -print0 | xargs -0 mv -t $PREFIX/share/fonts
#may need a command to download icons and then assign them as system default, alternatively go to icons folder, delete all, and replace with a single set
#add a command to set system font to poppins + size, and import termux terminal config to assign RedditMono there.

# Import Wallpaper
mkdir Wallpapers
mv ~/Starlike/Wallpapers/wallpaper.jpg ~/Wallpapers

#Import i3status (Toolbar Dependency) & XResources (scaling - depending on your display you might want to adjust the DPI)

mv ~/Starlike/i3status.conf $PREFIX/etc
mv ~/Starlike/.Xresources ~/

# Import & Move Configs

rm -rf .config
mv ~/Starlike/Config ~/
mv Config .config

rm -rf $PREFIX/share/xfce4
mv ~/Starlike/xfce4 $PREFIX/share

mv ~/Starlike/Config/state ~/.mpd

# Choose Icon Set

pkg install papirus-icon-theme
#pkg install adwaita-icon-theme

# Wait (Avoid Lag Conflicts) Then Delete the Cloned Folder
sleep 3
rm -rf Starlike
