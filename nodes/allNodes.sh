#!/bin/bash
source ../config.sh

### data imported from config.sh
cookie=$cookie

response=`wget -qO- --header="$cookie" 'https://www.planet-lab.eu/db/nodes/index.php?active_line_tab=All+nodes'`
list=`echo "$response"|grep '/db/nodes/node.php?'|gawk 'match($0, /.*node\.php\?id=([0-9]+)'"'"'>([^<]+)<\/a><\/td><td class=.*node-k?ok?'"'"'>([^<]+)<.*/, value) { print value[1] " " value[2] " " value[3]}'`
echo "$list"
