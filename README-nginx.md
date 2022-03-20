# raskeytar.at - Nginx

WebSite hosted with Nginx in a Docker Container.

This project is part of a solution to show different possibilities to host a WebSite inside a Docker container 
with the help of different servers and frameworks.  
See [WebSite raskeytar.at](README.md).

Nginx (pronounced as "Engine-X") is an open source web server that is often used as reverse proxy or HTTP cache. 

REMARKS: This sample only hosts static content.

## Prerequisites

To host a WebSite with Apache2-WebServer 
- nginx

```bash
$ sudo apt-get update
$ sudo apt-get install nginx
```

For an installation tutorial on Ubuntu see https://ubuntu.com/tutorials/install-and-configure-nginx

## Directory-Structure
```
.
├── README-nginx.md             Nginx documentation
├── README.md                   Documentation of the main-project
├── build-nginx.sh              Build script, creates the Docker container
├── run-nginx.sh                Run script, executes the pre-built Docker container
├── static                      Static pages of the raskeytar.at sample website
│   ├── ... 
└── tempdir                     Temporary directory used by the build-scripts to generate the docker container
    ├── Dockerfile              The generated Dockerfile
```

## Build
```bash
./build-nginx.sh
```
The generated docker container is based on the official dockerhub-image from ubuntu

## Run the WebSite (as docker container)
Attention: The docker image has to be built already.
```bash
./run-nginx.sh
```

Details:
- Run ```docker run -t -d -p 8082:80 --name raskeytarapp3 raskeytarapp-nginx``` to start the container
- Open http://127.0.0.1:8082/ in your browser.
- Run ```docker stop raskeytarapp3``` to shutdown container.


