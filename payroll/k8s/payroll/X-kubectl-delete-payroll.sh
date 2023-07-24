#!/bin/sh
kubectl config set-context --current --namespace payroll
kubectl delete -f new-payroll-deployment.yaml
#kubectl delete pods,services -l name=new-payroll-deployment
kubectl delete service payroll