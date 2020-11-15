#!/bin/bash
kubectl get pods -n crypto -o name > output

while IFS= read -r line
do
  kubectl exec -n crypto -f $line 
done < output

kubectl exec -n crypto -f ratcoin-wallet-deployment.yaml /bin/RatCoind getinfoie