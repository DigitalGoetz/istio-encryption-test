#!/bin/bash
export INSPECTOR=$(kubectl get all -n traffic | grep inspector | grep pod | awk '{ print $1 }')
kubectl exec -it $INSPECTOR -- bash