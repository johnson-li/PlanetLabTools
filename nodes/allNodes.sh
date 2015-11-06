#!/bin/bash
source ../config.sh

### data imported from config.sh
cookie=$cookie

#response=`wget -qO- --header='Cookie: PHPSESSID=21lj3t8nng81a8hur952lsm920; __utma=129731661.939814143.1445780721.1446187628.1446723350.3; __utmc=129731661; __utmz=129731661.1445780721.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); uechat_5038_first_time=1446732713523; uechat_5038_mode=0; uechat_5038_pages_count=2' 'https://www.planet-lab.eu/db/nodes/index.php?active_line_tab=All+nodes'`
response=`wget -qO- --header="$cookie" 'https://www.planet-lab.eu/db/nodes/index.php?active_line_tab=All+nodes'`
list=`echo "$response"|grep '/db/nodes/node.php?'|gawk 'match($0, /.*node\.php\?id=([0-9]+)'"'"'>([^<]+)<\/a><\/td><td class=.*node-k?ok?'"'"'>([^<]+)<.*/, value) { print value[1] " " value[2] " " value[3]}'`
echo "$list"
