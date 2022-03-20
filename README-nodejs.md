# raskeytar.at - NodeJS

WebSite hosted with NodeJS & ExpressJS in a Docker Container.

This project is part of a solution to show different possibilities to host a WebSite inside a Docker container 
with the help of different servers and frameworks.  
See [WebSite raskeytar.at](README.md).

The used structure and pre-implementation of the WebSite was generated with ExpressJS, see below.

TODOs:  
  [] finish docker for nodejs  

## Prerequisites

To host a WebSite with NodeJS and the use of the ExpressJS-library
- nodejs
- npm

```bash
$ sudo apt-get update
$ sudo apt-get install nodejs npm
# package.json defines the dependencies
$ npm install 
```

see also https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04

## Directory-Structure
```
.
├── README-nodejs.md            NodeJS & ElementJS documentation
├── README.md                   Documentation of the main-project
├── app_nodejs                  NodeJS & ElementJS specific files
│   └── www
├── app_nodejs.js               The Main script to start the WebSite
├── build-nodejs.sh             Build script, creates the Docker container
├── package-lock.json           Package file (automatically generated on ```npm install```)
├── package.json                Dependencies 
├── run-nodejs.sh               Run script, executes the pre-built Docker container
├── static                      Static pages of the raskeytar.at sample website
│   ├── ... 
└── tempdir                     Temporary directory used by the build-scripts to generate the docker container
    ├── Dockerfile              The generated Dockerfile
```

## Build
```bash
./build-nodejs.sh
```
The generated docker container is based on the official dockerhub-image node:16

## Run the WebSite directly (without docker)
```bash
DEBUG=nodejs-express:* npm start
```

## Run the WebSite (as docker container)
Attention: The docker image has to be built already.
```bash
./run-nodejs.sh
```

Details:
- Run ```docker run -t -d -p 8083:8080 --name raskeytarapp4 raskeytarapp-nodejs``` to start the container
- Open http://localhost:8083/ in your browser.
- Run ```docker stop raskeytarapp4``` to shutdown container.


## Build your own website structure
To build your own website structure you may use the ExpressJS-Library as explained in the following tutorial
https://expressjs.com/en/starter/generator.html

ATTENTION: Don't do this in this application - that was already done!

```bash
$ npx express-generator
...
$ npm install
```

## Further Material
see 
- https://expressjs.com/en/starter/generator.html
- https://code-boxx.com/simple-http-web-server-nodejs/
- https://note.hommalab.io/posts/nodejs/nodejs-http-server/
