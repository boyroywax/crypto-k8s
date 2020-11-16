#!/bin/bash
FILE=/root/.RatCoin/RatCoin.conf
if [ ! -f "$FILE" ]; then
    cp /root/RatCoin.conf $FILE
fi

RatCoind -daemon & trap : TERM INT; sleep infinity & wait