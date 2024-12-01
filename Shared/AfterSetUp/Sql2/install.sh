#!/bin/bash

sudo apt install mariadb-server pacemaker corosync pcs -y

sudo cp /vagrant/Shared/MariaDB/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

Copy Corosync configuration file and start the services
sudo cp /vagrant/Shared/MariaDB/corosync.conf /etc/corosync/corosync.conf
sudo systemctl enable --now corosync pacemaker pcsd

# Create the MariaDB resource
sudo pcs resource create mariadb systemd:mariadb op monitor interval=1s

# Disable STONITH since we won't be using it
sudo pcs property set stonith-enabled=false

# Create the VirtualIP resource
sudo pcs resource create virtualip ocf:heartbeat:IPaddr2 ip=192.168.91.110 cidr_netmask=24 op monitor interval=1s

# Set the Mariadb resource to start with the VirtualIP resource
sudo pcs constraint colocation add mariadb with virtualip INFINITY

sudo pcs constraint location mariadb prefers sql1=100
sudo pcs constraint location mariadb prefers sql2=50

# Set the migration threshold
sudo pcs resource update mariadb meta migration-threshold=0
sudo pcs resource update virtualip meta migration-threshold=0

# # Restart the services
sudo systemctl restart corosync pacemaker pcsd
