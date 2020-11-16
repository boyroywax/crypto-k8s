#!/usr/bin/env bash
FILE=/root/.pawcoin/pawcoin.conf
if [ ! -f "$FILE" ]; then
    cp /root/pawcoin.conf $FILE
fi
/bin/pawcoind --daemon & trap : TERM INT; sleep infinity & wait


