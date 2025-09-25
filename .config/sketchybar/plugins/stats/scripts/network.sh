#!/usr/bin/env bash

EN0_UPDOWN=$(ifstat -i "en0" -b 0.1 1 | tail -n1)
EN0_DOWN=$(echo "$EN0_UPDOWN" | awk "{ print \$1 }" | cut -f1 -d ".")
EN0_UP=$(echo "$EN0_UPDOWN" | awk "{ print \$2 }" | cut -f1 -d ".")

EN8_UPDOWN=$(ifstat -i "en8" -b 0.1 1 | tail -n1)
EN8_DOWN=$(echo "$EN8_UPDOWN" | awk "{ print \$1 }" | cut -f1 -d ".")
EN8_UP=$(echo "$EN8_UPDOWN" | awk "{ print \$2 }" | cut -f1 -d ".")

DOWN=$((EN0_DOWN + EN8_DOWN))
UP=$((EN0_UP + EN8_UP))

DOWN_FORMAT=""
if [ "$DOWN" -gt "999" ]; then
  DOWN_FORMAT=$(echo "$DOWN" | awk '{ printf "%03.0f Mbps", $1 / 1000}')
else
  DOWN_FORMAT=$(echo "$DOWN" | awk '{ printf "%03.0f kbps", $1}')
fi

UP_FORMAT=""
if [ "$UP" -gt "999" ]; then
  UP_FORMAT=$(echo "$UP" | awk '{ printf "%03.0f Mbps", $1 / 1000}')
else
  UP_FORMAT=$(echo "$UP" | awk '{ printf "%03.0f kbps", $1}')
fi

sketchybar -m --set network.down label="$DOWN_FORMAT" icon.highlight=$(if [ "$DOWN" -gt "0" ]; then echo "on"; else echo "off"; fi) \
  --set network.up label="$UP_FORMAT" icon.highlight=$(if [ "$UP" -gt "0" ]; then echo "on"; else echo "off"; fi)
