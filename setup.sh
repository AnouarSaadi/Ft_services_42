#!/bin/bash

# Nginx container
docker build -t nginx:service srcs/Nginx

# phpMyAdmin container
docker build -t phpmyadmin:service srcs/phpMyAdmin