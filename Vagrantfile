Vagrant.configure("2") do |config|
  # Global configuration
  config.vm.synced_folder "./Shared", "/shared"

  # Configuration for web1
  config.vm.define "web1V2" do |web_1|
    web_1.vm.box = "ubuntu/bionic64"
    web_1.vm.hostname = "web1"
    web_1.vm.network "private_network", ip: "192.168.91.121"

    web_1.vm.disk :disk, size: "3GB", name: "sdb"
    web_1.vm.disk :disk, size: "3GB", name: "sdc"

    web_1.vm.provider "virtualbox" do |vb|
      vb.name = "web_1"
      vb.memory = 1024
      vb.cpus = 2
    end

    web_1.vm.provision "shell", inline: <<-SHELL
      chmod +x /vagrant/*.sh
      bash /shared/General/systemUpdate.sh
      bash /shared/Web/raid_SetUp.sh
      bash /shared/GlusterFS/install.sh
      bash /shared/General/updateHosts.sh
      bash /shared/Web/nginxWeb.sh
      bash /shared/General/cacti.sh
      sudo reboot
    SHELL
  end

  # Configuration for web2
  config.vm.define "web2V2" do |web_2|
    web_2.vm.box = "ubuntu/bionic64"
    web_2.vm.hostname = "web2"
    web_2.vm.network "private_network", ip: "192.168.91.122"
    
    web_2.vm.disk :disk, size: "3GB", name: "sdb"
    web_2.vm.disk :disk, size: "3GB", name: "sdc"

    web_2.vm.provider "virtualbox" do |vb|
      vb.name = "web_2"
      vb.memory = 1024
      vb.cpus = 2
    end

    web_2.vm.provision "shell", inline: <<-SHELL
      chmod +x /vagrant/*.sh
      bash /shared/General/systemUpdate.sh
      bash /shared/Web/raid_SetUp.sh
      bash /shared/GlusterFS/install.sh
      bash /shared/General/updateHosts.sh
      bash /shared/Web/nginxWeb.sh
      bash /shared/General/cacti.sh
      sudo reboot
    SHELL
  end


  config.vm.define "sql1" do |sql1|
    sql1.vm.box = "ubuntu/bionic64"
    sql1.vm.hostname = "sql1"
    sql1.vm.network "private_network", ip: "192.168.91.111"

    sql1.vm.provider "virtualbox" do |vb|
      vb.name = "sql1"
      vb.memory = 1024
      vb.cpus = 2
    end

    sql1.vm.provision "shell", inline: <<-SHELL
      chmod +x /vagrant/*.sh
      bash /shared/General/systemUpdate.sh
      bash /shared/General/updateHosts.sh
      bash /shared/Glusterfs/sql.sh
      bash /shared/General/cacti.sh
      sudo reboot
    SHELL
  end

  config.vm.define "sql2" do |sql2|
    sql2.vm.box = "ubuntu/bionic64"
    sql2.vm.hostname = "sql2"
    sql2.vm.network "private_network", ip: "192.168.91.112"

    sql2.vm.provider "virtualbox" do |vb|
      vb.name = "sql2"
      vb.memory = 1024
      vb.cpus = 2
    end

    sql2.vm.provision "shell", inline: <<-SHELL
      chmod +x /vagrant/*.sh
      bash /shared/General/systemUpdate.sh
      bash /shared/General/updateHosts.sh
      bash /shared/Glusterfs/sql.sh
      bash /shared/General/cacti.sh
      sudo reboot
    SHELL
  end

  config.vm.define "proxy1" do |proxy1|
    proxy1.vm.box = "ubuntu/bionic64"
    proxy1.vm.hostname = "proxy1"
    proxy1.vm.network "private_network", ip: "172.20.91.200"
    proxy1.vm.network "private_network", ip: "192.168.91.100"

    proxy1.vm.provider "virtualbox" do |vb|
      vb.name = "proxy1"
      vb.memory = 1024
      vb.cpus = 2
    end

    proxy1.vm.provision "shell", inline: <<-SHELL
      chmod +x /vagrant/*.sh
      bash /shared/General/systemUpdate.sh
      bash /shared/General/updateHosts.sh
      bash /shared/Proxy/install.sh
      bash /shared/General/cacti.sh
      sudo reboot
    SHELL
  end

  config.vm.define "proxy2" do |proxy2|
    proxy2.vm.box = "ubuntu/bionic64"
    proxy2.vm.hostname = "proxy2"
    proxy2.vm.network "private_network", ip: "172.20.91.201"
    proxy2.vm.network "private_network", ip: "192.168.91.101"


    proxy2.vm.provider "virtualbox" do |vb|
      vb.name = "proxy2"
      vb.memory = 1024
      vb.cpus = 2
    end

    proxy2.vm.provision "shell", inline: <<-SHELL
      chmod +x /vagrant/*.sh
      bash /shared/General/systemUpdate.sh
      bash /shared/General/updateHosts.sh
      bash /shared/Proxy/install.sh
      bash /shared/General/cacti.sh
      sudo reboot
    SHELL
  end

  config.vm.define "cacti" do |cacti|
    cacti.vm.synced_folder "./Shared", "/shared"
    cacti.vm.box = "ubuntu/jammy64"
    cacti.vm.hostname = "cacti"
    cacti.vm.network "private_network", ip: "192.168.91.150"

    cacti.vm.provider "virtualbox" do |vb|
      vb.name = "cacti"
      vb.memory = 2048
      vb.cpus = 2
    end

    cacti.vm.provision "shell", inline: <<-SHELL
      chmod +x /vagrant/*.sh
      bash /shared/General/systemUpdate.sh
      # bash /shared/Cacti/cacti.sh
      sudo reboot
    SHELL
  end

  config.vm.define "ganglia" do |ganglia|
    ganglia.vm.synced_folder "./Shared", "/shared"
    ganglia.vm.box = "ubuntu/jammy64"
    ganglia.vm.hostname = "ganglia"
    ganglia.vm.network "private_network", ip: "192.168.91.152"

    ganglia.vm.provider "virtualbox" do |vb|
      vb.name = "ganglia"
      vb.memory = 2048
      vb.cpus = 2
    end

    ganglia.vm.provision "shell", inline: <<-SHELL
      chmod +x /vagrant/*.sh
      bash /shared/General/systemUpdate.sh
      bash /shared/Cacti/ganglia.sh
      sudo reboot
    SHELL
  end
end