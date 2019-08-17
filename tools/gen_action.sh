#!/bin/bash

URL=$1
NAME=$2
TMPFILE="/tmp/${NAME}.txt"

if ! grep -q "^actionsfile ${NAME}.action" /etc/privoxy/config; then
    echo "[WARNING] Add 'actionsfile ${NAME}.action' in /etc/privoxy/config file"
fi

rm -f "${TMPFILE}"
wget "${URL}" -O "${TMPFILE}" 

echo "{ +block{${NAME}} }" > "/etc/privoxy/${NAME}.action"

grep '\^\$third-party' "${TMPFILE}" | 
    tr '@@||' '\n.' |
    sed 's/\^\$third-party//g' |
    sed -E 's/^[\.]+(.*)/\.\1/g' |
    sed -E 's/\.([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)/\1/g' |
    sort -u |
    grep -E '^[a-zA-Z0-9.-]+$' >> "/etc/privoxy/${NAME}.action"

