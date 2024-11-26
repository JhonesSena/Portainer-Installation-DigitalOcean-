# Portainer-Installation-DigitalOcean

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


Foi criado um arquivo install_portainer.sh para automatizar o processo de instalação do Docker e Portainer em uma máquina Linux com Ubuntu. Certifique-se de rodar o script como root ou usando sudo.

Como usar o script
Salve o código acima em um arquivo chamado install_portainer.sh.

Torne o arquivo executável : chmod +x install_portainer.sh
Execute o script como root : sudo ./install_portainer.sh

Esse script automatiza todo o processo descrito anteriormente, incluindo configuração do firewall e inicialização do Portainer.




