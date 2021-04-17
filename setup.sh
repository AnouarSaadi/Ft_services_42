#!/bin/bash


# Images building
docker build -t nginx srcs/Nginx
docker build -t phpmyadmin srcs/phpMyAdmin
docker build -t phpmyadmin srcs/MySQL
docker build -t wordpress srcs/WordPress

# Create Deployemnts

kubectl apply -f nginx/deployment.yaml
kubectl apply -f phpMyadmin/deployment.yaml

# Create Services

kubectl apply -f nginx/service.yaml
kubectl apply -f phpMyAdmin/service.yaml