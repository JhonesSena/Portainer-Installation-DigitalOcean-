# Portainer-Installation-DigitalOcean-
Portainer Installation Guide on DigitalOcean (Ubuntu)


This guide explains how to install Portainer Community Edition on a DigitalOcean droplet running Ubuntu.

01-Update the System:

sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common

2-Install Docker:

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
sudo apt install docker-ce
3-Configure Docker:


sudo usermod -aG docker root
docker run hello-world
Deploy Portainer:


docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
Firewall Configuration:


sudo ufw allow 9443
sudo ufw allow 8000
sudo ufw reload


Access Portainer:
Navigate to https://<SERVER_IP>:9443 in your browser, create the admin account, and start managing containers.
