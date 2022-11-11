#!/bin/bash
export INSPECTOR=$(kubectl get all -n traffic | grep inspector | grep pod | awk '{ print $1 }')
echo "retrieving obs from $INSPECTOR"
kubectl exec -it $INSPECTOR -- bash -c ./fetch.sh