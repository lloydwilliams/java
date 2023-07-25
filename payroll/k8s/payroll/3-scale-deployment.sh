#!/bin/sh
kubectl config set-context --current --namespace payroll
kubectl scale --replicas=3 deployment payroll