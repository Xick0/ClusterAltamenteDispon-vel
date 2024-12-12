!/bin/bash

GLUSTER_MOUNT="/cluster/www"

sudo apt install nginx -y

sudo systemctl stop nginx

sudo sed -i "s|^\s*root\s*/var/www/html;|        root $GLUSTER_MOUNT;|" /etc/nginx/sites-available/default
sudo sed -i "s|^\s*root\s*/var/www/html;|        root $GLUSTER_MOUNT;|" /etc/nginx/sites-enabled/default

sudo chown -R www-data:www-data $GLUSTER_MOUNT
sudo chmod -R 755 $GLUSTER_MOUNT

sudo systemctl restart nginx
sudo systemctl enable nginx

