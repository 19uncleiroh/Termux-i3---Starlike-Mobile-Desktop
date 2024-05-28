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

After a the first minute (once you chose N four times), you no longer need to monitor the installer. Rest should be fully automated and you can keep it running in the background. All that's left is waiting for the installer to finish.

# Starting the Desktop

Once the installation finishes, type ```starti3``` and hit ```Enter``` and it should auto-start the desktop with a preconfigured program layout (personally customizable).

# Shutting Dowm

To KILL the i3 session and Termux, there are 3 methods:

Method 1 (Recommended): ```Alt + Ctrl + k```

Method 2: ```Alt + d``` opens program menu. Navigate to ```Kill i3``` and either double-click it or press Enter.

Method 3: Open any terminal type ```killi3```, then hit ```Enter```.
