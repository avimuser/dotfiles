#!/bin/sh

echo '{ "version": 1 }'
echo '['

FG="#FFFFFFbb"

RED="#F4511E"
GREEN="#7CB342"
YELLOW="#FDD835"

common() {
    local color="${2:-$FG}"
	echo "    { 'full_text': '$1', 'color': '$color', 'separator': false, 'separator_block_width': 30 },"
}

get_localip() {
    local content=$(ip a show wlan0 | grep 'inet ' | awk '{print $2}' | cut -d'/' -f1)
    common "$content" 
}

get_battery() {
	local battery="/sys/class/power_supply/BAT0"
	local capacity=$(cat "$battery/capacity" 2>/dev/null || echo "N/A")
	local status=$(cat "$battery/status" 2>/dev/null || echo "Unknown")
    local color=""

	if [ "$status" = "Discharging" ]; then
        if [ "$capacity" -le 20 ]; then
		    color="$YELLOW"
        fi
        if [ "$capacity" -le 10 ]; then
            color="$RED"
        fi
	fi

	if [ "$status" = "Charging" ] || [ "$status" = "Not charging" ] || [ "$status" = "Full" ]; then
		color="$GREEN"
	fi

	common "$capacity%" "$color"
}

while true; do
	echo "["
	get_localip
	get_battery
    common "$(date '+%a %b %d')"
    common "$(date '+%I:%M %p')"
	echo "],"
	sleep 1
done
