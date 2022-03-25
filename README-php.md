# raskeytar.at - PHP

WebSite hosted with PHP (with Apache2) in a Docker Container.

This project is part of a solution to show different possibilities to host a WebSite inside a Docker container 
with the help of different servers and frameworks.  
See [WebSite raskeytar.at](README.md).

PHP is one of the most used languages when it comes to programming dynamic web sites. 

## Prerequisites

To host a WebSite with PHP on an Apache2-WebServer 
- php
- apache2

```bash
$ sudo apt-get update
$ sudo apt-get install php
```

For an installation tutorial on Ubuntu see https://linuxconfig.org/how-to-install-php-on-ubuntu-linux

## Directory-Structure
```
.
├── README-php.md           Apache2 documentation
├── README.md                   Documentation of the main-project
├── build-php.sh            Build script, creates the Docker container
├── run-php.sh              Run script, executes the pre-built Docker container
├── app_php                     Dynamic pages of the raskeytar.at sample website
│   ├── ... 
├── static                      Static pages of the raskeytar.at sample website
│   ├── ... 
└── tempdir                     Temporary directory used by the build-scripts to generate the docker container
    ├── Dockerfile              The generated Dockerfile
```

## Build
```bash
./build-php.sh
```
The generated docker container is based on the official dockerhub-image php:7.0-apache

## Run the WebSite (as docker container)
Attention: The docker image has to be built already.
```bash
./run-php.sh
```

Details:
- Run ```docker run -t -d -p 8084:80 --name raskeytarapp5 raskeytarapp-php``` to start the container
- Open http://127.0.0.1:8084/ in your browser.
- Run ```docker stop raskeytarapp5``` to shutdown container.


## Further Material:
- Docker php example: https://tecadmin.net/tutorial/docker-php-example
