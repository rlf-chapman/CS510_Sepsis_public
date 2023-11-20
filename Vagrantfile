Vagrant.configure("2") do |config|
  # Set the Ubuntu box to use
  config.vm.define "box" do |b|
  config.vm.box = "boxen/ubuntu-22.04-x86_64"
  config.vm.disk :disk, size: "200GB", primary: true

  # Configure the virtual machine
  # config.vm.network "private_network", type: "dhcp" # You can also use a static IP address
  config.vm.network "public_network", bridge: "Intel(R) 82579LM Gigabit Network Connection"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 8192 # Set the amount of RAM for the VM
    vb.cpus = 4 # Set the number of CPU cores for the VM
  end
  
  config.ssh.username = 'vagrant'
  config.ssh.password = 'vagrant'
  config.ssh.insert_key = 'true'
  config.vm.synced_folder ".", "/vagrant", disabled: true

  
  config.vm.provision "file", source: "install_mimiciii.sh", destination: "$HOME/install_mimic.sh"
  config.vm.provision "file", source: "pg_hba.conf", destination: "$HOME/pg_hba.conf"
  # Shell provisioner to install PostgreSQL
  config.vm.provision "shell", inline: <<-SHELL
    # Update the package list
    sudo apt-get update
    sudo apt -y upgrade

    #Expand filesystem
    sudo growpart /dev/sda 3
    sudo lvresize -r -l 100%VG /dev/ubuntu-vg/ubuntu-lv
    lsblk
    df -h
	
    #Install useful utilities
    sudo apt -y install vim tcpdump tmux net-tools g++ gcc unrar make cmake 

    # Install PostgreSQL and configure it
    sudo apt -y install postgresql postgresql-contrib

    # Allow remote access to PostgreSQL (for development purposes only)
    sudo cp /home/vagrant/pg_hba.conf /etc/postgresql/14/main/pg_hba.conf
    sudo systemctl enable postgresql
    sudo systemctl restart postgresql
	
	  #Install jupyterlab
	  sudo apt-get install -y python3-pip
    pip3 install jupyterlab
    sudo reboot
  SHELL

  config.vm.provision :reload
  config.vm.provision "file", source: "MIMIC-III.rar", destination: "$HOME/MIMIC-III.rar"
  config.vm.provision "shell", inline: <<-SHELL
    echo "==== Creating mimic databse ===="
    sudo -i -u postgres psql -c "CREATE DATABASE mimic;"
    sudo chmod +x /home/vagrant/install_mimic.sh
    sudo ./home/vagrant/install_mimic.sh
  SHELL
  end
end
