# WebSite raskeytar.at with Python & Flask

The Website of raskeytar.at implemented in Python hosted by Flask.

## Prerequisites

### WebApp
- python3
- pip

```bash
$ sudo apt-get install python3-pip
$ sudo apt-get update
$ pip3 install flask
```

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

## Build

run  ```./build.sh```

## Run

### WebApp without Docker
run ```python raskeytar_app.py```

### WebApp inside Docker
Attention: The docker image has to be built already.
run ```./run-python.sh```

Details:
- Run ```docker run -t -d -p 8080:8080 --name raskeytarapp1 raskeytarapp-python``` to start the container
- Open http://127.0.0.1:8080/ in your browser.
- Run ```docker stop raskeytarapp1``` to shutdown container.
