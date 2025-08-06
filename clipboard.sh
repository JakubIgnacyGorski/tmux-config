#!/bin/sh

# Wayland
if [ -n "$WAYLAND_DISPLAY" ] && command -v wl-copy >/dev/null 2>&1; then
  wl-copy
# X11
elif [ -n "$DISPLAY" ] && command -v xsel >/dev/null 2>&1; then
  xsel --clipboard --input
elif [ -n "$DISPLAY" ] && command -v xclip >/dev/null 2>&1; then
  xclip -selection clipboard
else
  echo "Can't find tools for X11/Wayland" >&2
  exit 1
fi
