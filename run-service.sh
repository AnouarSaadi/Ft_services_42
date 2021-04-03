#!/bin/bash

docker build -t $1:service $2

docker run -it -p $3 -p $4 $1:service
