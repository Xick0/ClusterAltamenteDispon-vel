
sudo apt-get install snmpd -y
sudo apt-get install php-fpm php-mysql -y

cp /vagrant/Shared/Web/snmpd /etc/default/snmpd 
cp /vagrant/Shared/Web/snmpd.conf /etc/snmp/snmpd.conf 


sudo apt-get install snmp-mibs-downloader -y
sudo service snmpd restart  

sudo apt-get install cacti cacti-spine -y

ln -s /usr/share/cacti/site /cluster/www/cacti

sudo chown -R www-data:www-data /cluster/www/cacti

sudo chown -R www-data:www-data /usr/share/cacti
sudo chmod -R 777 /usr/share/cacti

sudo cp /vagrant/Shared/Web/default /etc/nginx/sites-available/default 

sudo rm /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

sudo systemctl reload nginx



