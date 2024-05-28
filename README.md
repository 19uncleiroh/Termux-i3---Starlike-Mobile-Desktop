# Prerequisites

Download Termux - Open source terminal for Android:

https://f-droid.org/repo/com.termux_118.apk

Download Termux:X11 - Need this to display the Desktop Environment separate of Android:

https://github.com/termux/termux-x11/releases

# Installation

Paste the command to Termux:

```
pkg install git -y && git clone https://github.com/19uncleiroh/Termux-i3---Starlike-Mobile-Desktop.git && mv Termux-i3---Starlike-Mobile-Desktop Starlike && chmod +x ~/Starlike/starlikei3-install.sh && ~/Starlike/starlikei3-install.sh
```

Press ```y``` + ```Enter``` for when it asks y/N - Press ```N``` + ```Enter``` when it asks for N Default.

After choosing N four times, you no longer need to monitor the installer. Rest should be fully automated - you can run it in the background. All that's left is waiting for the installer to finish.

# Starting the Desktop

Once the installation finishes, type ```starti3``` and hit ```Enter``` and it should auto-start the desktop with a preconfigured program layout (personally customizable).

# Shutting Down

To KILL the i3 session and Termux, there are 3 methods:

Method 1 (Recommended): ```Alt + Ctrl + k```. You can modify this in i3config, type ```nano ~/.config/i3/config``` in a terminal and ```Enter```.

Method 2: ```Alt + d``` opens program menu. Navigate to ```Kill i3``` and either double-click it or press Enter.

Method 3: Open any terminal and type ```killi3```, then hit ```Enter```.

# Usage & Navigation

For those unfamiliar with tiling window management system, it is a highly keyboard-centric environment while still maintaining mouse controls. 

To see my custom keybindings, type ```nano ~/.config/i3/config```. A config file will open which you can use to learn the different shortcuts for efficient workflow operation. Feel free to modify the config if some keybindings don't feel intuitive to you.

You'll mostly use the following shortcuts:

```Alt``` is the Superkey for everything - remember that.

```Alt + d``` - opens program launcher. (Alt+1/2/3/4 to navigate between tabs while it's open). Esc to close.

```Alt + v or h``` - set the orientation at which the next program opens. v for vertical, h for horizontal.

```Alt + Enter``` - opens terminal

```Shift + Enter``` - opens browser

```Alt + q``` - close any window

```Alt + Arrow (e.g. right)``` Navigates between windows in the current workspace

```Alt + Shift + Arrow``` - Move the currently highlighted window to a different slot.

Note: you can also move windows around with a mouse, similar to how you'd do it in Windows 10/11. Hold down ```Alt``` and press-hold on anywhere on the window you want to relocate. 

```Alt + w``` - Enter tabbed mode.

```Alt + e``` - Shift workflow direction to either vertical or horizontal

```Alt + f``` - Enter full-screen of currently highlighted window

```Alt + b``` - Show/hide bottom bar

```Alt + Number (e.g. 2)``` - jumps to a different workplace

For more advanced shortcuts, see https://i3wm.org/docs/refcard.html


