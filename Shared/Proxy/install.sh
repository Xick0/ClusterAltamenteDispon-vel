!/bin/bash

# Instalação HAProxy, Pacemaker, Corosync e Pcs
sudo apt install haproxy corosync pacemaker pcs -y

# Import dos Ficheiros de Configuração
sudo cp -r /vagrant/Shared/Proxy/corosync.conf /etc/corosync/corosync.conf
sudo cp -r /vagrant/Shared/Proxy/haproxy.cfg /etc/haproxy/haproxy.cfg

# Começar os serviços
sudo systemctl enable --now corosync pacemaker pcsd

# Criar os resources
sudo pcs resource create haproxy systemd:haproxy op monitor interval=1s
sudo pcs resource create virtualip ocf:heartbeat:IPaddr2 ip=172.20.91.1 cidr_netmask=24 op monitor interval=1s
sudo pcs property set stonith-enabled=false

# Colocar o HAProxy a começar ocm o virtual IP
sudo pcs constraint colocation add haproxy with virtualip INFINITY

#migration threshold
sudo pcs resource update haproxy meta migration-threshold=0
sudo pcs resource update virtualip meta migration-threshold=0

# Restart aos serviços
sudo systemctl restart corosync pacemaker pcsd

