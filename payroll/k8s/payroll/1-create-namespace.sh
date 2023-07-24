#!/bin/sh
kubectl create namespace payroll

echo setting the current context default namespace to  
kubectl config set-context --current --namespace payroll

