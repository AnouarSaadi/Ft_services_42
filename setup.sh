#!/bin/sh


# Set up the cluster & MetalLB Installation & Config.
A="setup"
if [ $1 == $A ]; then
    minikube start
    eval $(minikube docker-env)
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
    kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
    kubectl apply -f srcs/MetalLB/ConfigMap.yaml
fi;

svc_arr=( nginx phpmyadmin mysql wordpress ftps)

# Images building
B="build"
if [ $1 == $B ]; then
    for i in "${svc_arr[@]}";
        do docker build -t $i srcs/$i;
    done;
fi;

# Create Deployemnts & Services
C="apply"
if [ $1 == $C ]; then
    for i in "${svc_arr[@]}";
        do kubectl apply -f ./srcs/$i/;
    done;
fi;

# Removin' all Deployments & Services
D="rm"
if [ $1 == $D ]; then 
    for i in "${svc_arr[@]}"; do kubectl delete -f ./srcs/$i/; done;
fi;