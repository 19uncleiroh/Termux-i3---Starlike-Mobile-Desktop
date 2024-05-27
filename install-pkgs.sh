#!/bin/bash

#Define Optional Software to be installed (feel free to modify selection)

pkgs=(
'chromium'		#music playback
'ranger'		#for music playback via external programs, not necessary for local audio players
'nano'			#simple text editor in terminal
'ani-cli'		#anime client
'peaclock'		#simple customizable terminal clock widger
'htop'			#system monitor/task manager
'pkgtop'		#package manager
'cointop'		#cryptocurrency tracker
'fzf'			#filesystem searcher
'qalc'			#calculator and unit converter, incl. currency conversion
'xfce4-terminal'	#low resource but flexible terminal
'mpv'			#plays music&videos from local and youtube
'mpd'			#audio backend dependency
'ncmpcpp'		#powerful commandline music player & visualizer
'wego'			#simple weather forecast tool
'python-yt-dlp'		#dependency to download via ytfzf
'ytfzf'			#commandline youtube client with downloading support
'lxappearance'		#commandline reddit client for quick browsing
'git'			#valuable for codebase access and/or development work
'wget'			#pull targeted repos from gitlab
'xdotool'		#dependency for startup scripts and rofi app launcher - if you don't need automated app-startups or rofi you can skip
#add text base browser if necessary, e.g. w3m, links2, lynx, etc.
)

#Execute the Install without asking for permission at every package. Remove everything after "${pkgs[@]}" if you wish to manually approve every package size.

pkg install "${pkgs[@]}" -y -o Dpkg::Options::="--force-confold"


#get pip apps

pip install tuir	#commandline reddit client for quick browsing


#OPTIONAL - set up debian proot for additional packages

proot-distro login debian
apt update
apt install xfce4-terminal -y
exit

#Rename i3 to any DE/WM you chose in starti3 script


#Create .Xresources
#Add Xft.dpi: 144



##################### READ ME - TROUBLESHOOTING AND ADDITIONAL TIPS ###############################

#recommended additional user-action-required steps : install vimium (keyboard navigation for browser) for chrome, dark knight mode, and rose pine theme -- you can find all from chrome extensions store

#running proot distro apps via "prun + app name" in terminal or creating desktop executable files like this:

#proot-distro login debian --shared-tmp
#export XDG_RUNTIME_DIR=${TMPDIR}
#env DISPLAY=:0 alacritty

#running scripts without sh and just their name =
#copy it to usr/local/bin. chmod +x "script name" too so they become executable (permission error)

#have to import font awesome

#chmod +x scripts and then move to usr/bin so they can be started with keyword not ./script.sh

#install proot-distro + debian + debian terminal

#(optional if you want a GUI for debian side too)
#move the starti3 script to debian root folder and install i3 to debian

# set up executable items so you can proot-run apps in x11 

#import wallpaper and poppins font

#pkg install pavucontrol-qt (and set audio back to 100%) otherwise it crackles or use the bundled pulsemixer

#Iceberg or tomorrow night theme

#Rose pine dawn/moon/default themes
