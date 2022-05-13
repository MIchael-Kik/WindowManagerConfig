#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

~/WindowManagerConfig/dwm-bar/dwm_bar.sh &

# Setting resolutions
xrandr --setprovideroutputsource modesetting NVIDIA-0 

# Detecting and Setting resloutions for multi monitor setups ( HDMI-0 only )
HDMI_CONNECT=$(xrandr | grep "HDMI-0" | awk '{print $2}')

if [ $HDMI_CONNECT == "disconnected" ]; then
    xrandr --auto
else
   xrandr --output LVDS-1-1 --mode 1920x1080 --output HDMI-0 --mode 1600x900 --left-of LVDS-1-1 
fi

# Compositor
picom -f --experimental-backends &

# Background random slideshow for User michaelkik
Oxygen-app /Pictures 1800 &

while true; do
	dwm >/dev/null 2>&1
done

# Execute DWM
exec dwm 
