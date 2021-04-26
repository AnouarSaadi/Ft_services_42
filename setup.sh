#!/bin/sh

# Author "asaadi <asaadi@student.1337.ma>"

# Set up the cluster & MetalLB Installation & Config.
A="setup"
if [ $1 == $A ]; then
    minikube delete
    minikube start
    eval $(minikube docker-env)
    export MINIKUBE_IP=$(minikube ip)
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
    kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
    kubectl apply -f srcs/MetalLB/ConfigMap.yaml
fi;

svc_arr=( nginx phpmyadmin mysql wordpress ftps influxdb grafana telegraf)

# Images building
B="build"
if [ $1 == $B ]; then
    if  [ $2 ]; then
        docker build -t $2 srcs/$2;
    else
        for i in "${svc_arr[@]}";
            do docker build -t $i srcs/$i;
        done;
    fi;
fi;

# Create Deployemnt & Service
C="apply"
if [ $1 == $C ]; then
    if [ $2 ]; then
        kubectl apply -f ./srcs/$2/;
    else
        for i in "${svc_arr[@]}";
            do kubectl apply -f ./srcs/$i/;
        done;
    fi;
fi;

# Removin' Deployment & Service
D="delete"
if [ $1 == $D ]; then
    if [ $2 ]; then
        kubectl delete -f ./srcs/$2/;
    else
        for i in "${svc_arr[@]}";
            do kubectl delete -f ./srcs/$i/;
        done;
    fi
fi;
