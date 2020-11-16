#!/bin/bash
FILE=/root/.tokemon/tokemon.conf
if [ ! -f "$FILE" ]; then
    cp /root/tokemon.conf $FILE
fi

tokemond -daemon & trap : TERM INT; sleep infinity & wait