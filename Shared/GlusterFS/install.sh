#!/bin/bash

# Atualizar os repositórios e instalar o GlusterFS
sudo apt update
sudo apt install -y glusterfs-server

# Iniciar e habilitar o serviço GlusterFS
sudo systemctl start glusterd
sudo systemctl enable glusterd

# Criar as pastas do "storage server"
sudo mkdir -p /raid1/cluster/www
sudo mkdir -p /raid1/cluster/sql

# Crias as "pastas locais"
sudo mkdir -p /cluster/www


