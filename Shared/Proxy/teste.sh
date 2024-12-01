#!/bin/bash

# Stop and disable HAProxy, Pacemaker, Corosync, and pcsd services
echo "Stopping and disabling services..."
sudo systemctl stop haproxy corosync pacemaker pcsd
sudo systemctl disable haproxy corosync pacemaker pcsd

# Remove Pacemaker cluster configuration
echo "Removing Pacemaker cluster configuration..."
sudo pcs cluster stop --all
sudo pcs cluster destroy --all

# Remove Pacemaker resources and constraints
echo "Cleaning up Pacemaker resources and constraints..."
sudo pcs resource delete haproxy --force
sudo pcs resource delete virtualip --force
sudo pcs constraint delete --all

# Remove Pacemaker properties
echo "Resetting Pacemaker properties..."
sudo pcs property unset stonith-enabled
sudo pcs property unset migration-threshold

# Remove Corosync configuration file
echo "Removing Corosync configuration..."
sudo rm -f /etc/corosync/corosync.conf

# Remove HAProxy configuration file
echo "Removing HAProxy configuration..."
sudo rm -f /etc/haproxy/haproxy.cfg

# Remove installed packages
echo "Uninstalling HAProxy, Pacemaker, Corosync, and pcs..."
sudo apt remove --purge -y haproxy corosync pacemaker pcs
sudo apt autoremove -y

# Clean up any remaining data
echo "Cleaning up remaining files and directories..."
sudo rm -rf /var/lib/pacemaker /var/lib/corosync /var/lib/pcs /etc/corosync /etc/ha.d /etc/pacemaker

# Restart the system services to ensure a clean state
echo "Restarting system services to ensure a clean state..."
sudo systemctl reset-failed

echo "Reversion complete. The system has been restored to its pre-configuration state."
