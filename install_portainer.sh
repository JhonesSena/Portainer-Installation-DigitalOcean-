#!/bin/bash

# Atualizar pacotes
echo "Atualizando pacotes..."
apt update -y && apt upgrade -y

# Instalar dependências
echo "Instalando dependências..."
apt install -y apt-transport-https ca-certificates curl software-properties-common

# Adicionar repositório Docker
echo "Adicionando repositório Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

# Instalar Docker
echo "Instalando Docker..."
apt update -y
apt install -y docker-ce

# Verificar status do Docker
echo "Verificando status do Docker..."
systemctl enable docker
systemctl start docker

# Adicionar usuário ao grupo Docker
echo "Adicionando usuário ao grupo Docker..."
usermod -aG docker $(whoami)

# Testar instalação do Docker
echo "Testando instalação do Docker..."
docker run hello-world

# Criar volume para Portainer
echo "Criando volume Docker para Portainer..."
docker volume create portainer_data

# Baixar e executar Portainer
echo "Instalando e iniciando Portainer..."
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data portainer/portainer-ce:latest

# Configurar firewall
echo "Configurando firewall..."
ufw allow 9443
ufw allow 8000
ufw reload

# Mensagem de finalização
echo "Instalação concluída. Acesse o Portainer em: https://<SEU_IP>:9443"
