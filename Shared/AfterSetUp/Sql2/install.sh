sudo apt install mariadb-server pacemaker corosync pcs -y

sudo cp /vagrant/Shared/MariaDB/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
sudo chmod -R 777 /cluster/sql

sudo systemctl restart mariadb

sudo cp /vagrant/Shared/MariaDB/corosync.conf /etc/corosync/corosync.conf

sudo systemctl enable --now corosync pacemaker pcsd

sudo systemctl restart corosync pacemaker pcsd

