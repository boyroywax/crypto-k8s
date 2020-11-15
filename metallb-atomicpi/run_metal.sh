#!/bin/bash
# On first install only

kubectl apply -f namespace.yaml
sleep 10
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
sleep 5
kubectl apply -f config.yaml
sleep 10
kubectl apply -f metallb.yaml
