#!/bin/bash

case "$DESKTOP_SESSION" in
  gnome|kde*|xfce*) # PulseAudio is started via XDG Autostart
  ;;
  *)
    # Extra checks in case DESKTOP_SESSION is not set correctly
    if [[ -z $KDE_FULL_SESSION && -z $GNOME_DESKTOP_SESSION_ID ]]; then
      /usr/bin/start-pulseaudio-x11
    fi
  ;;
esac

# .xinitrc
nitrogen --restore

# Mouse and Bell
xset m 2.1
xset b off

# Run user systemd daemons
systemd --user &

# We want numlock on. :)
numlockx

# restore firefox profile
/home/ferus/bin/pack_firefox.sh

# dropdox
dropboxd -i ~/.dropbox/config.db &

# ssh agent
eval $(ssh-agent)

# Start i3
exec i3
