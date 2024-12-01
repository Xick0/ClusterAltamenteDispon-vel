# #!/bin/bash

# # Install HAProxy, Pacemaker, Corosync and Pcs
# sudo apt install haproxy corosync pacemaker pcs -y

# # Copy HAProxy and Corosync configuration files
# sudo cp -r /vagrant/Shared/Proxy/corosync.conf /etc/corosync/corosync.conf
# sudo cp -r /vagrant/Shared/Proxy/haproxy.cfg /etc/haproxy/haproxy.cfg

# Start the services
sudo systemctl enable --now corosync pacemaker pcsd

# Create the HAProxy resource
sudo pcs resource create haproxy systemd:haproxy op monitor interval=1s

# Disable STONITH since we won't be using it
sudo pcs property set stonith-enabled=false

# Create the VirtualIP resource
sudo pcs resource create virtualip ocf:heartbeat:IPaddr2 ip=172.20.91.1 cidr_netmask=24 op monitor interval=1s

# Set the HAProxy resource to start with the VirtualIP resource
sudo pcs constraint colocation add haproxy with virtualip INFINITY

# Set the migration threshold
sudo pcs resource update haproxy meta migration-threshold=0
sudo pcs resource update virtualip meta migration-threshold=0

# Restart the services
sudo systemctl restart corosync pacemaker pcsd