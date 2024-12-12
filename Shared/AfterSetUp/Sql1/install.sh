!/bin/bash

sudo apt install mariadb-server pacemaker corosync pcs -y

sudo cp /vagrant/Shared/MariaDB/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

sudo chmod -R 777 /cluster/sql

if  [ "$(ls -A "/cluster/sql")" ]; then
    echo "INSTALATEDS"
else
    sudo mysql_install_db --defaults-file=/etc/mysql/my.cnf
fi

sudo chmod -R 777 /cluster/sql

sudo systemctl restart mariadb

sudo cp /vagrant/Shared/MariaDB/corosync.conf /etc/corosync/corosync.conf
sudo systemctl enable --now corosync pacemaker pcsd

sudo pcs resource create mariadb systemd:mariadb op monitor interval=1s

sudo pcs property set stonith-enabled=false

sudo pcs resource create virtualip ocf:heartbeat:IPaddr2 ip=192.168.91.110 cidr_netmask=24 op monitor interval=1s

sudo pcs constraint colocation add mariadb with virtualip INFINITY

sudo pcs resource update mariadb meta migration-threshold=0
sudo pcs resource update virtualip meta migration-threshold=0

sudo systemctl restart corosync pacemaker pcsd

