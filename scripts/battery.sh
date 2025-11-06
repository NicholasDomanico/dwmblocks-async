#! /bin/sh
. ~/.cache/wal/colors.sh

status=$(cat /sys/class/power_supply/BAT0/status)
charge=$(cat /sys/class/power_supply/BAT0/capacity)

case $BLOCK_BUTTON in 
    1) notify-send -h string:bgcolor:$background -h string:fgcolor:$color2 -a "" -i NONE "$(acpi -b)"
esac

case $status in
    "Discharging")
        color="$color6" ;;
    "Full")
        color=#00d000 ;;
    "Charging")
        color=#00d000 ;;
    *)
        color="$color6" ;;
esac

if [ $charge -gt 80 ]; then
    echo "^c$color^ "
elif [ $charge -gt 60 && -le 80 ]; then
    echo "^c$color^ "
elif [ $charge -gt 40 && -le 60 ]; then
    echo "^c$color^ "
elif [ $charge -gt 15 && -le 40 ]; then
    echo "^$color^ "
elif [ $charge -gt 0 && -le 15 ]; then 
    echo "^#ff0f00^ "
fi


