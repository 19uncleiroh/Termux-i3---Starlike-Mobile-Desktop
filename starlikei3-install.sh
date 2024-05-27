#!/bin/bash

# Base Setup
pkg update && upgrade -y
pkg install x11-repo
pkg install termux-x11-nightly

# Choose DE/WM
pkg install i3 -y		#low resource and ez to configure window manager for keyboard-centric workflows
pkg install rofi -y		#required for displaying my app-launcher, can replace with dmenu
pkg install feh -y		#sets wallpaper and doubles as image viewer

# Compositor (optional)
pkg install picom -y		#not necessary if you don't want window transparency

####   Install Termux:X11 app at this point onto your Android system - necessary to launch the GUI and see your desktop    ####

# Prepare More Repositories / Packages
pkg install python		#access to python packages (don't need if ranger is installed first, as it auto-downloads it)
pkg install tur-repo		#access to chromium, vss code, etc. - if you are happy with nvim and firefox, not necessary

# Setup Audio
pkg install pulseaudio -y	#for music playback via browsers, not necessary for local audio players etc.
pip install pulsemixer -y	#minimalist cli-based volume control
pip install mpc -y		#necessary for bottom bar widget - very optional

#Define Optional Software to Be Installed (Feel Free to Modify Selection)

pkgs=(
'firefox'		# web browser
'peaclock'		# simple customizable terminal clock widget
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
'wget'			# pull targeted repos from gitlab
'xdotool'		# dependency for startup scripts and rofi app launcher - if you don't need automated app-startups or rofi you can skip
#add text base browser if necessary, e.g. w3m, links2, lynx, etc.
)

#Execute the Install without asking for permission at every package. Remove everything after "${pkgs[@]}" if you wish to manually approve every package size.

pkg install "${pkgs[@]}" -y -o Dpkg::Options::="--force-confold"

# Install PIP Packages (Python Required)

pip install tuir	#commandline reddit client for quick browsing

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

############################  END PROOT DISTRO  ###################################################



#Rename i3 to any DE/WM you chose in starti3 script

#Create .Xresources
#Add Xft.dpi: 144


#################################  APPEARANCE  & DESKTOP   ###################################################

# Clone Repo & Rename Folder -- IMPORTANT - when you make it public eventually, change to HTML instead of SSH
#mv Termux-i3---Starlike-Mobile-Desktop Starlike

# Make Scripts Executable Without ./x.sh  & Move to System Bin
cd ~/Starlike/scripts
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

####################################################################################################################



##################### READ ME - TROUBLESHOOTING AND ADDITIONAL TIPS ###############################

#recommended additional user-action-required steps : install vimium (keyboard navigation for browser) for chrome, dark knight mode, and rose pine theme -- you can find all from chrome extensions store

#running proot distro apps via "prun + app name" in terminal or creating desktop executable files like this:

#proot-distro login debian --shared-tmp
#export XDG_RUNTIME_DIR=${TMPDIR}
#env DISPLAY=:0 alacritty


# Install GTK & Browser themes: Rose Pine, Iceberg, or your Choice.

# If you encounter issues with crackling audio from Pulseaudio, install "pkg install pavucontrol-qt" and set audio back to 100%.
