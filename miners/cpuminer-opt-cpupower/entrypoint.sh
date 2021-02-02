#!/bin/sh

set -e
# chown -R nobody:nogroup /va/logs
echo "Starting Mining"
# exec gosu nobody "$@"
# sleep 6000
# ./cpuminer -a cpupower -o stratum+tcp://MiningMadness.com:6550 -u CVkM2g7nLawDZh18981yESbsYtjyKzK157.k8s -p c=CPU
exec "$@"
