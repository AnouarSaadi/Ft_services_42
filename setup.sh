#!/bin/bash

# Set up the cluster
# minikube start
# eval $(minikube docker-env)

# MetalLB Installation & Config.
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
# kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl create -f srcs/MetalLB/ConfigMap.yaml

# Images building
docker build -t nginx srcs/nginx
docker build -t phpmyadmin srcs/phpMyAdmin
docker build -t mysql srcs/MySQL
docker build -t wordpress srcs/WordPress

# Create Deployemnts

kubectl apply -f srcs/nginx/deployment.yaml
kubectl apply -f srcs/phpMyadmin/deployment.yaml
kubectl apply -f srcs/MySQL/deployment.yaml
kubectl apply -f srcs/WordPress/deployment.yaml

# Create Services

kubectl apply -f srcs/nginx/service.yaml
kubectl apply -f srcs/phpMyAdmin/service.yaml
kubectl apply -f srcs/MySQL/service.yaml
kubectl apply -f srcs/WordPress/service.yaml
