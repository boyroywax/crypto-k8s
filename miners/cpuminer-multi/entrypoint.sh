#!/bin/sh

set -e
# chown -R nobody:nogroup /va/logs
echo "Starting Mining"
# exec gosu nobody "$@"
# sleep 6000
./cpuminer -a groestl -o stratum+tcp://hub.miningpoolhub.com:20486 -u boyroywax.k8s:pass -p c=CPU
# exec "$@"
