# raskeytar.at - Apache2

WebSite hosted with Apache2 in a Docker Container.

This project is part of a solution to show different possibilities to host a WebSite inside a Docker container 
with the help of different servers and frameworks.  
See [WebSite raskeytar.at](README.md).

Apache is the most commonly used Web server on Linux systems.
See [HTTPD - Apache2 Web Server](https://ubuntu.com/server/docs/web-servers-apache).

REMARKS: This sample only hosts static content.

## Prerequisites

To host a WebSite with Apache2-WebServer 
- apache2

```bash
$ sudo apt-get update
$ sudo apt-get install apache2
```

For an installation tutorial on Ubuntu see https://ubuntu.com/tutorials/install-and-configure-apache

## Directory-Structure
```
.
├── README-apache2.md           Apache2 documentation
├── README.md                   Documentation of the main-project
├── build-apache2.sh            Build script, creates the Docker container
├── run-apache2.sh              Run script, executes the pre-built Docker container
├── static                      Static pages of the raskeytar.at sample website
│   ├── ... 
└── tempdir                     Temporary directory used by the build-scripts to generate the docker container
    ├── Dockerfile              The generated Dockerfile
```

## Build
```bash
./build-apache2.sh
```
The generated docker container is based on the official dockerhub-image httpd:2.4

## Run the WebSite (as docker container)
Attention: The docker image has to be built already.
```bash
./run-apache2.sh
```

Details:
- Run ```docker run -t -d -p 8081:80 --name raskeytarapp2 raskeytarapp-apache2``` to start the container
- Open http://127.0.0.1:8081/ in your browser.
- Run ```docker stop raskeytarapp2``` to shutdown container.


## Further Material:
- VirtualHost examples: https://httpd.apache.org/docs/2.4/vhosts/examples.html
