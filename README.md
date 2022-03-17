# WebSite raskeytar.at 

Shows different possibilities to host a WebSite inside a Docker container 
with the help of different servers/frameworks, like
- Python & Flask-Library
- Apache2 (static content only)
- Nginx (static content only)


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


### Python with Flask-library
- python3
- pip

```bash
$ sudo apt-get install python3-pip
$ sudo apt-get update
$ pip3 install flask
```


## Build

### Python with Flask-library
run  ```./build-python.sh```

### Apache2 WebServer
run  ```./build-apache2.sh```

### Nginx WebServer (on Ubuntu)
run  ```./build-nginx.sh```

## Run

### Python+Flask WebApp without Docker
run ```python raskeytar_app.py```

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
