#!/bin/bash
cd /home/ubuntu
yes | sudo apt update

#Install docker
sudo apt install docker.io -y
sleep 20
sudo usermod -aG docker ubuntu
newgrp docker
sudo chmod 777 /var/run/docker.sock
docker version
sudo systemctl start docker
sudo systemctl enable docker

# Run sonarqube
docker run -d --name sonar -p 9000:9000 sonarqube:lts-community
# Install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sleep 20
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version