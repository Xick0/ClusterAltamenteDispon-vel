

apt-get install apache2 mariadb-server php libapache2-mod-php php-mbstring php-curl php-zip php-gd php-mysql php-curl unzip wget -y



sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update

sudo apt-get install php7.4 -y

sudo apt-get install apache2 mariadb-server php7.4 libapache2-mod-php7.4 php7.4-mbstring php7.4-curl php7.4-zip php7.4-gd php7.4-mysql unzip wget -y

apt-get install apache2 mariadb-server php libapache2-mod-php php-mbstring php-curl php-zip php-gd php-mysql php-curl unzip wget -y

ln -fs /usr/share/zoneinfo/Europe/Lisbon /etc/localtime

sudo add-apt-repository ppa:ondrej/php
sudo apt-get update

sudo apt-get install apache2 mariadb-server php8.2 libapache2-mod-php8.2 php8.2-mbstring php8.2-curl php8.2-zip php8.2-gd php8.2-mysql php8.2-cli unzip wget -y
sudo apt-get install php8.2-xml php8.2-intl php8.2-bcmath php8.2-soap php8.2-imagick -y

sudo apt-get install ganglia-monitor rrdtool gmetad ganglia-webfrontend -y

systemctl start ganglia-monitor
systemctl start gmetad
systemctl enable ganglia-monitor
systemctl enable gmetad

sed -i 's/;date.timezone =/date.timezone = Europe\/Lisbon/' /etc/php/8.2/apache2/php.ini
sed -i 's/;date.timezone =/date.timezone = Europe\/Lisbon/' /etc/php/8.2/cli/php.ini


cp /vagrant/Shared/Cacti/gmetad.conf /etc/ganglia/gmetad.conf  
cp /vagrant/Shared/Cacti/gmond.conf /etc/ganglia/gmond.conf 

cp /etc/ganglia-webfrontend/apache.conf /etc/apache2/sites-enabled/ganglia.conf

cp /etc/apache2/sites-enabled/ganglia.conf /vagrant/Shared/Cacti/ganglia.conf

systemctl restart ganglia-monitor
systemctl restart gmetad
systemctl restart apache2

sudo cp /var/log/apache2/error.log /vagrant/Shared/Cacti/error.log

sudo cp /vagrant/Shared/Cacti/ganglia.php /usr/share/ganglia-webfrontend/ganglia.php

sudo systemctl restart apache2