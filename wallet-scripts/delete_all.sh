#!/bin/bash
kubectl delete -f ../wallet-docker/pawcoin-wallet-docker/k8s-spec-dev/pawcoin-wallet-deployment.yaml
sleep 5
kubectl delete -f ../wallet-docker/ratcoin-wallet-docker/k8s-spec-dev/ratcoin-wallet-deployment.yaml
sleep 5
kubectl delete -f ../wallet-docker/tokemon-wallet-docker/k8s-spec-dev/tokemon-wallet-deployment.yaml
sleep 5
kubectl delete -f ../wallet-docker/mic3-wallet-docker/k8s-spec-dev/mic3-wallet-deployment.yaml