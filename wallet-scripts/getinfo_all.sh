#!/bin/bash
kubectl get pods -n crypto -o name > output

while IFS= read -r line
do
  if [[ "$line" == *"rat"* ]]; then
    echo "RatCoin Wallet - $line"
    kubectl exec -n crypto "$line" -- /bin/RatCoind getinfo
  fi
  if [[ "$line" == *"tokemon"* ]]; then
    echo "Tokemon Wallet - $line"
    kubectl exec -n crypto "$line" -- /bin/tokemond getinfo
  fi
  if [[ "$line" == *"pwc"* ]]; then
    echo "Pawcoin Wallet - $line"
    kubectl exec -n crypto "$line" -- /bin/pawcoin-cli getinfo
  fi
  if [[ "$line" == *"mic3"* ]]; then
    echo "Mic3 Wallet - $line"
    kubectl exec -n crypto "$line" -- /bin/Mic3d getinfo
  fi
done < output