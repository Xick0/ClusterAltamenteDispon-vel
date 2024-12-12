sudo apt install snmp snmpd -y

cp /vagrant/Shared/General/snmpd.conf /etc/snmp/snmpd.conf
sudo systemctl restart snmpd



