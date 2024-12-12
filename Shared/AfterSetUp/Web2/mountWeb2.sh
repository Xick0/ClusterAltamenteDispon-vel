#!/bin/bash

sudo mount -t glusterfs web2:/storage/www /cluster/www

echo "web2:/storage/www /cluster/www glusterfs defaults,_netdev 0 0" >> /etc/fstab

#Rebuild ao boot.image
sudo update-initramfs -u
