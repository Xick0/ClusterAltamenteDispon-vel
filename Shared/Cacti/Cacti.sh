sudo apt-get install cacti cacti-spine -y

sudo apt-get install snmpd -y
sudo apt-get install php-fpm php-mysql -y

cp /vagrant/Shared/Web/snmpd /etc/default/snmpd 
cp /vagrant/Shared/Web/snmpd.conf /etc/snmp/snmpd.conf 

sudo apt-get install snmp-mibs-downloader -y

sudo systemctl restart snmpd
sudo systemctl restart apache2  


