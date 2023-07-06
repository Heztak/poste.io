#!/bin/bash

# Actualiza el sistema operativo
sudo apt-get update
sudo apt-get upgrade -y

# Instala dependencias necesarias
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y

# Descarga e instala la clave GPG oficial de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Configura el repositorio estable de Docker
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Actualiza la lista de paquetes e instala Docker
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose -y

# Verifica la versión instalada de Docker
docker version
