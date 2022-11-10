#!/bin/bash


# Kubernetes
kind create cluster --name net-encryption
kubectl create namespace traffic
kubectl config set-context --current --namespace traffic

# Istio
istioctl install --set values.global.proxy.privileged=true --set values.global.logging.level=debug  --set profile=demo -y
kubectl label namespace traffic istio-injection=enabled

# PostgreSQL
kubectl apply -f ./postgres/postgres-pv.yaml
kubectl apply -f ./postgres/postgres-pvc.yaml
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm install database bitnami/postgresql -f ./postgres/values.yaml
export POSTGRES_PASSWORD=$(kubectl get secret -n traffic database-postgresql -o jsonpath="{.data.postgres-password}" | base64 --decode)
kubectl wait -l statefulset.kubernetes.io/pod-name=database-postgresql-0 --for=condition=ready pod --timeout=-1s

# Retriever
kubectl apply -f retriever/
kubectl wait --namespace traffic --for=condition=ready deployment.apps/observations-retriever --timeout=120s

# Inspector
kubectl apply -f inspector/inspector.yaml
kubectl wait --namespace traffic --for=condition=ready replicaset.apps/inspector-59595998cb --timeout=120s
