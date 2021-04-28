#!/bin/sh

# Author "asaadi <asaadi@student.1337.ma>"

# Set up the cluster & MetalLB Installation & Config.
if [ ! $1 ]; then
    minikube delete
    minikube start
    eval $(minikube docker-env)
    minikube addons enable metrics-server &> /dev/null
    minikube addons enable dashboard &> /dev/null
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
    kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
    kubectl apply -f srcs/MetalLB/ConfigMap.yaml
    clear
fi;

svc_arr=( nginx phpmyadmin mysql wordpress ftps influxdb grafana )

# Images building
A="build"
if [ ! $1 ]; then
    for i in "${svc_arr[@]}";
        do  docker build -t $i srcs/$i;
            echo "\033[1;32mThe $i image built successfully !\033[0m";
    done;
elif [ $1 == $A ]; then
    if  [ $2 ]; then
        docker build -t $2 srcs/$2;
        echo "\033[1;32mThe $2 image built successfully !\033[0m";
    else
        for i in "${svc_arr[@]}";
            do  docker build -t $i srcs/$i;
                echo "\033[1;32mThe $i image built successfully !\033[0m";
        done;
    fi;
fi;


# Create Deployemnt & Service
B="apply"
if [ ! $1 ]; then
    for i in "${svc_arr[@]}";
        do  kubectl apply -f ./srcs/$i/;
            echo "\033[1;32mThe $i-deployment and $i-service are created successfully !\033[0m";
    done;
elif [ $1 == $B ]; then
    if [ $2 ]; then
        kubectl apply -f ./srcs/$2/;
        echo "\033[1;32mThe $2-deployment and $2-service are created successfully !\033[0m";
    else
        for i in "${svc_arr[@]}";
            do  kubectl apply -f ./srcs/$i/;
                echo "\033[1;32mThe $i-deployment and $i-service are created successfully !\033[0m";
        done;
    fi;
fi;


# Removin' Deployment & Service
C="delete"
if [ "$1" == "$C" ]; then
    if [ $2 ]; then
        kubectl delete -f ./srcs/$2/;
        echo "\033[1;31mThe $2 objects are removed successfully !!!\033[0m";
    else
        for i in "${svc_arr[@]}";
            do  kubectl delete -f ./srcs/$i/;
                echo "\033[1;31mThe $i objects are removed successfully !!!\033[0m";
        done;
    fi;
fi;

minikube dashboard
