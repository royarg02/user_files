#!/bin/sh
case "$2" in
  AC*|AD*)
    case "$4" in
      00000000)
        kill -42 "$(pidof dwmblocks)" ;;
      00000001)
        kill -42 "$(pidof dwmblocks)" ;;
    esac
esac
