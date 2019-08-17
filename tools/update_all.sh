#!/bin/bash

bash tools/gen_action.sh https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt ublock
bash tools/gen_action.sh https://easylist.to/easylist/easyprivacy.txt easylistprivacy
bash tools/gen_action.sh https://easylist-downloads.adblockplus.org/liste_fr.txt listfr
bash tools/gen_action.sh https://easylist.to/easylist/easylist.txt easylist

for i in $(cat whitelist.txt); do sed -i "/^$i$/d" *.action ; done

systemctl restart privoxy.service

