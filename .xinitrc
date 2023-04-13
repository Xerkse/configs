#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
# merge in defaults and keymaps
xcompmgr -o1 &

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

#some things i added

#xrandr --output HDMI-A-2 --mode 2560x1440 --rate 143.91 --output HDMI1 --mode 1920x1080 --rate 60 --left-of HDMI-A-2 --output VGA-2-1 --mode 1600x900 --rate 60 --right-of HDMI-A-2
#xrandr --output HDMI1 --mode 2560x1440 --rate 59.95 --output VGA-2-1 --mode 1600x900 --rate 60 --left-of HDMI1

#random ascii art on login, possibly insecure
#  setRandomLoginPic &
setDwmStatusBar &
# MPD daemon start (if no other user instance exists)
# [ ! -s ~/.config/mpd/pid ] && mpd &
#picom --no-fading-openclose &

#xcompmgr -o1 &

#fix resolution to 1920x1080 and set theme if it succedes 
xrandr --output eDP1 --scale 0.5x0.5 --panning 1920x1080
xrandr --output eDP2 --scale 0.5x0.5 --panning 1920x1080
setTheme

#fix touchpad speed
xinput set-prop "SynPS/2 Synaptics TouchPad" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1 &

#xinput set-prop "TPPS/2 Elan TrackPoint" "Coordinate Transformation Matrix" 0.5 0 0 0 0.5 0 0 0 1 &
xinput set-prop "TPPS/2 Elan TrackPoint" "libinput Accel Speed" -0.5 &
xinput set-prop "TPPS/2 Elan TrackPoint" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1 &
xinput set-prop "TPPS/2 Elan TrackPoint" "libinput Scrolling Pixel Distance" 25 &

#fix escape
setxkbmap -option caps:swapescape &


while true; do
	dwm 2> ~/.dwm.log
done

#exec dwm
