/usr/libexec/pulseaudio-module-xrdp/load_pa_modules.sh

# Statusbar loop
while true; do
    xsetroot -name "$( date +"%F %R" )"
    sleep 1m    # Update time every minute
done &

exec dwm
