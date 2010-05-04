# don't show nautilus desktop
echo Disable Desktop support for nautilus
gconftool-2 --type boolean --set /apps/nautilus/preferences/show_desktop false

# pulseaudio as default
echo Set PulseAsudio as default
gconftool-2 -t string --set /system/gstreamer/0.10/default/audiosink pulsesink
gconftool-2 -t string --set /system/gstreamer/0.10/default/audiosrc pulsesrc

