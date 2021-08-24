#!/bin/sh
case "$2" in
	HEADPHONE)  kill -38 $(pidof dwmblocks) ;;
	MICROPHONE) kill -37 $(pidof dwmblocks) ;;
	*)          logger "APCI action undefined: $2" ;;
esac
