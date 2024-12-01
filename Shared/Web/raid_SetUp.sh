#!/bin/bash

# Instalar o mdadm
sudo apt update && sudo apt install mdadm -y

# Criar o RAID 1 com os discos sdb e sdc
sudo mdadm --create /dev/md127 --level=1 --raid-devices=2 /dev/sdc /dev/sdd -R

#Save dos RAID arrays no ficheiro conf do mdadm
sudo mdadm --detail --scan >> /etc/mdadm/mdadm.conf

#Rebuild ao boot.image
sudo update-initramfs -u

# Criar o sistema de arquivos no RAID
sudo mkfs.ext4 /dev/md127

# Criar o ponto de montagem específico
sudo mkdir -p /raid1

# Montar o RAID no ponto de montagem
sudo mount /dev/md127 /raid1

# Configurar montagem automática no /etc/fstab
echo '/dev/md127 /raid1 ext4 defaults 0 0' | sudo tee -a /etc/fstab

#Rebuild ao boot.image
sudo update-initramfs -u
