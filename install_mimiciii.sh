#!/bin/bash
if [[ $EUID -ne 0 ]]; then
    # Not running as root, check if SUDO_USER is set
    if [ -n "$SUDO_USER" ]; then
        echo "Running with sudo privileges as user: $SUDO_USER"
    else
        echo "Please run this script with sudo privileges."
        exit 1
    fi
else
    # Running as root, install tools here as root
    # Example: apt-get install <tool_name>
    echo "Running as root."
fi


mv /home/vagrant/MIMIC-III.rar /var/lib/postgresql/
cd /var/lib/postgresql/
echo "====================Unrar-ing Database===================="
unrar x MIMIC-III.rar
echo "====================Inflating Database===================="
cd MIMIC-III/
gunzip *.gz
echo "==========Creating Tables and Loading Data into Postgresql=========="
cd ../
git clone https://github.com/MIT-LCP/mimic-code.git
cd /var/lib/postgresql/mimic-code/mimic-iii/buildmimic/postgres
make create-user mimic datadir="/var/lib/postgresql/MIMIC-III/"
echo "====================Script Complete===================="