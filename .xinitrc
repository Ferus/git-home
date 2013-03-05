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
