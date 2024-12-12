!/bin/bash

sudo gluster peer probe web2

# Criar o volume GlusterFS
yes | sudo gluster volume create storage replica 2 transport tcp web1:/raid1/cluster web2:/raid1/cluster

# # Iniciar o volume
yes | sudo gluster volume start storage

sudo mount -t glusterfs web1:/storage/www /cluster/www

echo "web1:/storage/www /cluster/www glusterfs defaults,_netdev 0 0" >> /etc/fstab

#Rebuild ao boot.image
sudo update-initramfs -u

cp -r /vagrant/Shared/Web/indexHTML/* /cluster/www
