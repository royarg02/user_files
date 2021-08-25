#!/bin/sh

printf "\nCurrent date and time: %s\n" "$(date)"

printf "\nBattery status:\n"
for battery in /sys/class/power_supply/BAT?*; do
  name="$(basename "$battery")"
  capacity="$(cat "$battery/capacity")"
  status="$(cat "$battery/status")"
  printf "%s:\t%s%%, %s\n" "$name" "$capacity" "$status"
done
printf "\n"
