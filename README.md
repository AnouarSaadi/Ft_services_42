# Ft_services_42

#### Ft_services is a system administration and networking project.
#### Ft_services is about clustering management and deployment with Kubernetes. Also, the virtualization of a network and do "clustering".

<p align="center"> 
  <img src="https://i.imgur.com/DirUKzS.png" width="100%" />
</p>

### [TODO](#TODO)

* The project consists of setting up an infrastructure of different services with the [kubernetes](https://kubernetes.io).
* Setting up a multi-service [cluster](https://minikube.sigs.k8s.io/).
* Each service will run in a dedicated container.
* Containers have to be build with [Alpine Linux](https://alpinelinux.org/).
* Each container will be based by a image container. Each image will be build by a Dockerfile.

* Setting up:
  - [The Kubernetes Web Dashboard](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/) management of the cluster.
  - [The Load Balancer](https://metallb.universe.tf/) management of  the external access of the services.
  - [WordPress](https://wordpress.com/) website.
  - [phpMyAdmin](https://www.phpmyadmin.net/) handling the administration of MySQL over the Web.
  - [nginx](https://www.nginx.com/) an HTTP and reverse proxy server, a mail proxy server, and a generic TCP/UDP proxy server.
  - [FTPS](https://en.wikipedia.org/wiki/FTPS#:~:text=FTPS%20(also%20known%20FTP%2DSSL,prohibited%20by%20RFC7568)%20cryptographic%20protocols.).
  - [Grafana](https://grafana.com/) platform of monitoring the containers.

### how to launch ?

> After cloning the project, run the script ```setup.sh```, this script will setup all the applicaons.
