#!/bin/bash
FILE=/root/.Mousecoin/Mousecoin.conf
FILE2=/root/.Mousecoin/peers.dat
if [ ! -f "$FILE" ]; then
    cp /root/Mousecoin.conf $FILE
fi
if [ ! -f "$FILE2" ]; then
    cp /root/peers.dat $FILE2
fi

/bin/Mic3d --daemon & trap : TERM INT; sleep infinity & wait