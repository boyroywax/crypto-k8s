#!/bin/bash
kubectl delete -f ratcoin-wallet-deployment.yaml
sleep 10
kubectl delete -f tokemon-wallet-deployment.yaml