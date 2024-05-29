#!/bin/bash

# Base Setup
yes | pkg upgrade
pkg install x11-repo -y
pkg install termux-x11-nightly -y

# Choose DE/WM
pkg install i3 -y		# low resource and ez to configure window manager for keyboard-centric workflows
pkg install rofi -y		# required for displaying my app-launcher, can replace with dmenu
pkg install feh -y		# sets wallpaper and doubles as image viewer

# Compositor (optional)
pkg install picom -y		# not necessary if you don't want window transparency

# Prepare More Repositories / Packages
pkg install python -y		# access to python packages (don't need if ranger is installed first, as it auto-downloads it)
pkg install tur-repo -y		# access to chromium, vss code, etc. - if you are happy with nvim and firefox, not necessary

#Define Optional Software to Be Installed (Feel Free to Modify Selection)

pkgs=(
'mpc'			# necessary for bottom bar widget - very optional
'pulseaudio'		# for music playback via browsers, not necessary for local audio players etc
'firefox'		# web browser
'peaclock'		# simple customizable terminal clock widget
'micro'      		# minimal cli editor, for when nano is not enough
'ranger'		# powerful cli file manager
'nano'			# simple text editor in terminal
'ani-cli'		# anime client
'htop'			# system monitor/task manager
'pkgtop'		# package manager
'cointop'		# cryptocurrency tracker
'fzf'			# filesystem searcher
'qalc'			# calculator and unit converter, incl. currency conversion
'xfce4-terminal'	# low resource but flexible terminal
'mpv'			# plays music&videos from local and youtube
'mpd'			# audio backend dependency
'ncmpcpp'		# powerful commandline music player & visualizer
'wego'			# simple weather forecast tool
'python-yt-dlp'		# dependency to download via ytfzf
'ytfzf'			# commandline youtube client with downloading support
'lxappearance'		# commandline reddit client for quick browsing
'git'			# valuable for codebase access and/or development work
'wget'			# pull sources via links
'xdotool'		# dependency for startup scripts and rofi app launcher - if you don't need automated app-startups or rofi you can skip
'w3m'			# terminal web browser
)

# Execute the Install without asking for permission at every package. Remove everything after "${pkgs[@]}" if you wish to manually approve every package size.

pkg install "${pkgs[@]}" -y -o Dpkg::Options::="--force-confold"

# Install PIP Packages (Python Required)
yes | pip install tuir      #commandline reddit client for quick browsing
yes | pip install pulsemixer    #minimalist cli-based volume control

#############################################################################

#Rename i3 to any DE/WM you chose in starti3 script

#################################  APPEARANCE  & DESKTOP   ###################################################

# Make Scripts Executable Without ./x.sh  & Move to System Bin
cd ~/Starlike/scripts
chmod +x cp2menu debian killi3 op opf prun pruns starti3 zrun zrunhud
cd
find ~/Starlike/scripts -type f -print0 | xargs -0 mv -t $PREFIX/bin

# Move Launchers & Fonts to System Directories
find ~/Starlike/programs -type f -print0 | xargs -0 mv -t $PREFIX/share/applications
find ~/Starlike/Fonts -type f -print0 | xargs -0 mv -t $PREFIX/share/fonts

# Import Wallpaper
mkdir Wallpapers
mv ~/Starlike/Wallpapers/wallpaper.png ~/Wallpapers

#Import i3status (Toolbar Dependency) & XResources (scaling - depending on your display you might want to adjust the DPI)
mv ~/Starlike/i3status.conf $PREFIX/etc
mv ~/Starlike/.Xresources ~/

# Import & Move Configs
mv ~/Starlike/Config/state ~/.mpd
rm -rf .config
mv ~/Starlike/Config ~/
mv Config .config

rm -rf $PREFIX/share/xfce4
mv ~/Starlike/xfce4 $PREFIX/share

# Choose Icon Set
pkg install papirus-icon-theme
#pkg install adwaita-icon-theme

# Set up GTK Theme

wget https://github.com/dracula/gtk/archive/master.zip
unzip master.zip
mv gtk-master $PREFIX/share/themes

####################################################################################################################


######################   OPTIONAL - Set up Debian Proot for Additional Packages - Only Necessary if You NEED Packages From Debian Repos

pkg install proot-distro -y
proot-distro install debian
# proot-distro login debian #cant log in during the script, only via prun later, otherwise itll get stuck here after login as it cant execute things in debian
# apt update
# apt install alacritty -y
#use these as last commands

# SUPER OPTIONAL if you want a GUI for debian side too - mostly unnecessary

#proot-distro login debian
#apt install i3
#cp $PREFIX/data/data/com.termux/files/usr/bin/starti3 ./
### you can edit the copied starti3 now and edit to liking (e.g. assign a separate display to it if you want want to run both GUIs simultaneously)
#exit

############################  END PROOT DISTRO  ##################################################

## Start Desktop in 1st Time Mode (Sets Up Firefox Plugins & (TODO) Prompts Manual
mv ~/Starlike/starti3-1 ~/
chmod +x starti3-1
./starti3-1

# Wait (Avoid Lag Conflicts) Then Delete the Cloned Folder
sleep 5
rm -rf Starlike
rm starti3-1

##################### READ ME - TROUBLESHOOTING AND ADDITIONAL TIPS ###############################

#recommended additional user-action-required steps : install vimium (keyboard navigation for browser) for chrome, dark knight mode, and rose pine theme -- you can find all from chrome extensions store

#running proot distro apps via "prun + app name" in terminal or creating desktop executable files like this:

#proot-distro login debian --shared-tmp
#export XDG_RUNTIME_DIR=${TMPDIR}
#env DISPLAY=:0 alacritty


# Install GTK & Browser themes: Rose Pine, Iceberg, or your Choice.

# If you encounter issues with crackling audio from Pulseaudio, install "pkg install pavucontrol-qt" and set audio back to 100%.
