#!/bin/sh
# Start pulseaudio because something got broken in Ubuntu or Firefox
# or PulseAudio or or
# or... (https://askubuntu.com/questions/962920/how-do-i-get-pulseaudio-to-start-automatically-in-ubuntu-17-04-for-firefox):
if ! pulseaudio --check
then
  # But not via the old way:
  #
  #   nohup pulseaudio > /dev/null 2>&1 &
  #
  # Use the proper way to enable this at login time per https://askubuntu.com/a/989674/340383
  systemctl --user enable pulseaudio && systemctl --user start pulseaudio
fi
