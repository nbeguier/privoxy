#!/bin/bash

rm -f /tmp/easylist.txt
wget https://easylist.to/easylist/easylist.txt -O /tmp/easylist.txt

echo '{ +block{Easylist} }' > /etc/privoxy/easylist.action 

grep '\^\$third-party' /tmp/easylist.txt | tr '@@||' '\n.' | sed 's/\^\$third-party//g' | cut -c 2- | sort -u | grep -E '^[a-zA-Z0-9.-]+$' >> /etc/privoxy/easylist.action

