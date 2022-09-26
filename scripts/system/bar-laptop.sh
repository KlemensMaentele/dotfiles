#!/bin/bash

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors
. ~/.config/chadwm/scripts/bar_themes/onedark

cpu() {
	cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

	printf "^c$black^ ^b$green^ CPU"
	printf "^c$white^ ^b$grey^ $cpu_val"
}

pkg_updates() {
	# updates=$(doas xbps-install -un | wc -l) # void
	# updates=$(checkupdates | wc -l)   # arch , needs pacman contrib
	# updates=$(aptitude search '~U' | wc -l)  # apt (ubuntu,debian etc)

	if [ "0" == "$updates" ]; then
		printf "^c$green^  Fully Updated"
	else
		printf "^c$red^  $updates"" updates"
	fi
}

battery() {
	get_capacity="$(cat /sys/class/power_supply/BAT0/capacity)"
	get_status="$(cat /sys/class/power_supply/BAT0/status)"
	if [ $get_status == 'Discharging' ]; then
		printf "^c$white^^b$black^  $get_capacity"
	else
		printf "^c$white^^b$black^  $get_capacity"
	fi
}

brightness() {
	printf "^c$red^^b$black^  "
	printf "^c$red^%.0f\n" $(cat /sys/class/backlight/acpi_video0/brightness)
}

mem() {
	printf "^c$blue^^b$black^  "
	printf "^c$blue^ $(free -h | awk '/^Speicher/ { print $3 }' | sed s/i//g)"
}

wlan() {
	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	up) printf "^c$black^ ^b$blue^ 󰤨 ^d^%s" " ^c$blue^Connected" ;;
	down) printf "^c$black^ ^b$blue^ 󰤭 ^d^%s" " ^c$blue^Disconnected" ;;
	esac
}

clock() {
	printf "^c$black^ ^b$darkblue^ 󱑆 "
	printf "^c$black^^b$blue^ $(date '+%H:%M %a %d %b %Y')  "
}

volume() {
        volume=$(pamixer --get-volume)
        case "$(pamixer --get-mute)" in
        true) printf "^c$green^^b$black^" ;;
        false) printf "^c$green^^b$black^ " && printf "^c$green^^b$black^ $volume" ;;
        esac
}

kblayout(){
        printf "^c$white^^b$black^ $(setxkbmap -query | awk '/layout/{ print $2 }')"
}


while true; do

	[ $interval = 0 ] || [ $(($interval % 3600)) = 0 ]
	interval=$((interval + 1))

        sleep 1 && xsetroot -name " $(kblayout) $(volume) $(battery) $(brightness) $(cpu) $(mem) $(wlan) $(clock)"
done
