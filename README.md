# CS510 Sepsis Prediction Project

## Quickstart guide

1. Download and install VirtualBox for your operating system
    - link: https://www.virtualbox.org/wiki/Downloads
    - If your computer runs Windows, choose "Windows hosts."
    - If your computer runs MacOS, choose "macOS/Intel hosts" (I haven’t tested this on mac yet)
    - If your computer runs Linux, choose "Linux distributions", then pick the appropriate distro
    - Run the installer and follow on-screen instructions
    - When done (you may be prompted to reboot), launch VirtualBox to check the installation
2. Download and install Vagrant
    - link: https://developer.hashicorp.com/vagrant/install?product_intent=vagrant
    - Download the version for your OS
        - You can choose between Mac, Windows, and Linux. I've only tested against windows and Ubuntu 22.04
3. Open PowerShell or a terminal window and navigate to the directory you cloned this repo from
4. Run `vagrant up` in that directory
    - This requires an internet connection to work, as the disk image your VM will be based on will need to be downloaded the first time this script runs
    - This will take a few minutes. The script should spawn a minimal ubuntu 22.04 virtual machines on your computer. 
    - It should be configured to get an IP address on the same network as your computer with a "bridged" interface
    - It should update and upgrade all installed software and build a new kernel version
    - It should install some useful tools
    - It should install Postgres, and configure it to accept connections from anywhere
    - It should install jupyterlab
5. Connect to the spawned VM
    - run `vagrant ssh` from the terminal or PowerShell session you have open to connect to the VM
    - this command needs to be run from the same location as the Vagrantfile, otherwise vagrant will get confused and fail to connect
6. Change your password 
    - Run `passwd` 
    - Follow on-screen prompts
7. Make note of the IP address of the VM on the public interface
    - run `ifconfig` to get a report of all active network interfaces
    - Should be on interface "enp0s8"
    - In the example below, the IP we care about is 192.168.1.35, but may be different for you
![alt text](network_interfaces.PNG)
9. Reboot the VM
    - run `sudo reboot`
8. Check to see if Postgres is running
    - Run `systemctl status postgresql`
    - Green text is good, red text is bad
    - If it isnt running, try `systemctl restart postgresql`





