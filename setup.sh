#!/bin/sh

# Author "asaadi <asaadi@student.1337.ma>"

# Set up the cluster & MetalLB Installation & Config.
if [ ! $1 ]; then
    echo "\033[0;34m#         Minikube: Starting...\033[0m"
    minikube delete 1> /dev/null
    minikube config set memory 4096 2> /dev/null || true
    minikube start  1> /dev/null
    eval $(minikube docker-env)
    minikube addons enable metrics-server &> /dev/null
    minikube addons enable dashboard &> /dev/null
    echo "\033[0;34m#         Minikube: Starting: done!\033[0m"
    echo "\n"
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml 1> /dev/null || true
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml 1> /dev/null || true
    # Fisrt install only
    kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" 1> /dev/null || true
    echo "\033[1;34m#         MetalLB: Installation: done!\033[0m"
    kubectl apply -f srcs/MetalLB/ConfigMap.yaml 1> /dev/null || true
    echo "\033[1;34m#         MetalLB: ConfigMap: done!\033[0m"
    echo "\n"
fi

svc_arr=( nginx phpmyadmin mysql wordpress ftps influxdb grafana )

# Images building
A="build"
if [ ! $1 ]; then
    for i in "${svc_arr[@]}";
        do  echo "\033[1;32m#         Images: $i: Building...\033[0m";
            docker build -t $i srcs/$i 1> /dev/null;
            echo "\033[1;32m#         Images: $i: Done!\033[0m";
    done;
    echo "\n";
elif [ $1 == $A ]; then
    if  [ $2 ]; then
        echo "\033[1;32m#         Images: $2: Building...\033[0m";
        docker build -t $2 srcs/$2 1> /dev/null;
        echo "\033[1;32m#         Images: $2: Done!\033[0m";
    else
        for i in "${svc_arr[@]}";
            do  echo "\033[1;32m#         Images: $i: Building...\033[0m";
                docker build -t $i srcs/$i 1> /dev/null;
                echo "\033[1;32m#         Images: $i: Done!\033[0m";
        done;
    fi;
fi

# Create Deployemnt & Service
B="apply"
if [ ! $1 ]; then
    for i in "${svc_arr[@]}";
        do  kubectl apply -f ./srcs/$i/ 1> /dev/null;
            echo "\033[1;32m#         Objects: $i: Creation: Done!\033[0m";
    done;
    echo "\n";
    echo "\033[4;32m#         Dashboard Launching ... \033[0m";
    minikube dashboard 2> /dev/null || true;
elif [ $1 == $B ]; then
    if [ $2 ]; then
        kubectl apply -f ./srcs/$2/ 1> /dev/null;
        echo "\033[1;32m#         Objects: $2: Creation: Done!\033[0m";
    else
        for i in "${svc_arr[@]}";
            do  kubectl apply -f ./srcs/$i/ 1> /dev/null;
                echo "\033[1;32m#         Objects: $i: Creation: Done!\033[0m";
        done;
    fi;
fi

# Removin' K8s objects
C="delete"
if [ "$1" == "$C" ]; then
    if [ $2 ]; then
        kubectl delete -f ./srcs/$2/ 1> /dev/null;
        echo "\033[1;31m#         Objects: $2: Deleting: Done!\033[0m";
    else
        for i in "${svc_arr[@]}";
            do  kubectl delete -f ./srcs/$i/ 1> /dev/null;
                echo "\033[1;31m#         Objects: $i: Deleting: Done!\033[0m";
        done;
    fi;
fi