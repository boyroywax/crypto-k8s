#!/bin/bash
kubectl apply -f ratcoin-wallet-deployment.yaml
sleep 10
kubectl apply -f tokemon-wallet-deployment.yaml