#!/bin/bash

sudo mount -t glusterfs web2:/storage/sql /cluster/sql

echo "web1:/storage/sql /cluster/sql glusterfs defaults,_netdev 0 0" >> /etc/fstab

#Rebuild ao boot.image
sudo update-initramfs -u