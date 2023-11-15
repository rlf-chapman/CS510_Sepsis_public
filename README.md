# CS510 Sepsis Prediction Project

## Quickstart guide

1. Downlaod and install Virtualbox for your operating system
    - link: https://www.virtualbox.org/wiki/Downloads
    - If your computer runs Windows, choose "Windows hosts"
    - If you computer runs MacOS, choose "macOS/Intel hosts" (I havent tested this on mac yet)
    - If your computer runs Linux, choos "Linux distributions", then pick the appropriate distro
    - Run the installer and follow on-screen instructions
    - When done (you may be prompted to reboot), launch Virtualbox to check the installation
2. Download and install Vagrant
    - link: https://developer.hashicorp.com/vagrant/install?product_intent=vagrant
    - Download the version for your OS
        - You chan choose between Mac, Windows, and Linux. I've only tested against windows and Ubuntu 22.04
3. Open powershell or a terminal window and navigate to the directory you cloned this repo from
4. Run `vagrant up` in that directory
    - This will take a few minutes, but should spawn a minimal ubuntu 22.04 virtual machines on you computer. 
    - It should be configured to get an IP address on the same network as you computer with a "briged" interface
    - It should update and upgrade all installed software and build a new kernel version
    - It should install some useful tools
    - It should install postgres, and configure it to accept connections from anywhere
    - It should install jupyterlab
5. Once the installation script finishes, run 'vagrant ssh' from the terminal or powershell session you have open to connect to the VM
6. You should change your password 
    - Run `passwd` 
    - Follow on-screen prompts
7. Check to see if postgres is running
    - Run `systemctl status postgres`
    - Green text (active) means good, red text is bad
8. Reboot the VM
    - run `sudo reboot`



