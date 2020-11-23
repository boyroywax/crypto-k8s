#!/bin/bash
FILE=/root/.dogecoin/dogecoin.conf
if [ ! -f "$FILE" ]; then
    cp /root/dogecoin.conf $FILE
fi

/bin/dogecoind --daemon & trap : TERM INT; sleep infinity & wait