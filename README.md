# WebSite raskeytar.at 

This project shows different possibilities to host a WebSite inside a Docker container 
with the help of different servers and frameworks, like
- Python & Flask-Library, see [README-python.md](README-python.md)
- Apache2 (static content only), see [README-apache2.md](README-apache2.md)
- Nginx (static content only), see [README-nginx.md](README-nginx.md)
- NodeJS & Express-Library [README-nodejs.md](README-nodejs.md)

TODOs:  
  [] finish docker for nodejs  



## Prerequisites

### Docker
Install Docker Community to generate the container
see https://docs.docker.com/engine/install/ubuntu/

```bash
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo usermod -aG docker $USER

sudo service docker start
```
Remark: On WSL2 with Ubuntu you may need to recreate WSL networking, see below in the Troubleshooting-chapter.


### NodeJS
- nodejs
- npm

```bash
$ sudo apt-get update
$ sudo apt-get install nodejs npm
# package.json defines the dependencies
$ npm install 
```
see 
- https://expressjs.com/en/starter/generator.html
- https://code-boxx.com/simple-http-web-server-nodejs/
- https://note.hommalab.io/posts/nodejs/nodejs-http-server/


## Directory-Structure
```
.
├── LICENSE
├── README*.md              Documentation
├── app_*                   App-specific directories (containing plattform files)
├── build-*.sh              Build script, creates the Docker container
├── run-*.sh                Run script, executes the pre-built Docker container
├── static                  Static pages of the raskeytar.at sample website:
│   ├── assets
│   │   ├── css               Stylesheets
│   │   ├── fonts             Fonts
│   │   └── js                Client-Side JavaScript
│   ├── elements.html         Shows all elements of the CSS-Template
│   ├── favicon.ico           The WebSites favicon
│   ├── generic.html
│   ├── images                Images used in the WebSites content
│   └── index.html            The landing-page as static file (no dynamic content here)
└── tempdir                 Temporary directory used by the build-scripts to generate the docker container
    ├── Dockerfile          The generated Dockerfile
    ├── ...
```

## Build

### Apache2 WebServer
run  ```./build-apache2.sh```

### Nginx WebServer (on Ubuntu)
run  ```./build-nginx.sh```

## Run


### Python+Flask WebApp inside Docker
Attention: The docker image has to be built already.
run ```./run-python.sh```

Details:
- Run ```docker run -t -d -p 8080:8080 --name raskeytarapp1 raskeytarapp-python``` to start the container
- Open http://127.0.0.1:8080/ in your browser.
- Run ```docker stop raskeytarapp1``` to shutdown container.

### Apache2 hosted WebApp
run ```./run-apache2.sh```

### Nginx hosted WebApp
run ```./run-nginx.sh```


## Troubleshooting

### Docker on Windows with WSL2 and Ubuntu
Propably the installation of docker-ce in WSL would lead to networking problems (so did it at my machine).

Perform the following steps to fix the error:
```bash
# rm /etc/resolv.conf || true
# rm /etc/wsl.conf || true

# cat <<EOF > /etc/wsl.conf
[network]
generateResolvConf = true
[automount]
enabled = true
options = "metadata"
mountFsTab = false
EOF

# exit
```

In Windows, cmd as admin:
```
wsl --shutdown
netsh winsock reset
netsh int ip reset all
netsh winhttp reset proxy
ipconfig /flushdns
```
see also https://stackoverflow.com/questions/57633406/unable-to-access-network-from-wsl2
