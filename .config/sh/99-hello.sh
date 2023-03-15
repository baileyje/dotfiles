#/usr/bin/env sh

if [ -r /usr/share/fastfetch/presets/garuda ]; then
  fastfetch --load-config garuda
else
  fastfetch --load-config neofetch
fi
