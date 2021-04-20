#!/bin/bash

# Set up the cluster
# minikube start
# eval $(minikube docker-env)

# MetalLB Installation & Config.
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
    kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
    kubectl apply -f srcs/MetalLB/ConfigMap.yaml

my_arr=( nginx phpmyadmin mysql wordpress )

# Images building
a="build"
if [ $1 == $a ]; then
    for i in "${my_arr[@]}";
        do docker build -t $i srcs/$i;
    done;
fi;

# Create Deployemnts & Services
b="apply"
if [ $1 == $b ]; then
    for i in "${my_arr[@]}";
        do kubectl apply -f ./srcs/$i/;
    done;
fi;

# Removin' all Deployments & Services
c="rm"
if [ $1 == $c ]; then 
    for i in "${my_arr[@]}"; do kubectl delete -f ./srcs/$i/; done;
fi;
