#!/bin/sh
#kubectl create configmap private-location-worker-config
# kubectl -n namespacename create -f configmap.yaml
# kubectl delete secret access-tokensecret "access-token" deleted
#kubectl delete configmap private-location-worker-config -n datadog 
# kubectl delete -f <file-directory> -n <namespace-name>
#$ kubectl delete -f  configmap.yaml  -n  namespacename
#kubectl delete configmap private-location-worker-config

kubectl delete secret generic private-location-worker-config
kubectl delete -f private-location-worker-deployment.yaml