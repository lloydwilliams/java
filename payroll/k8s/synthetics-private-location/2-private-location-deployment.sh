#!/bin/sh
kubectl config set-context --current --namespace default
kubectl apply -f private-location-worker-deployment.yaml