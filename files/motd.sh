#!/usr/bin/env bash

curr_batt_percent=$(< /sys/class/power_supply/BAT0/capacity)
echo "The current battery charge is at $curr_batt_percent%."

