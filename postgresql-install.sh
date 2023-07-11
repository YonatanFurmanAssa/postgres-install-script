#!/bin/bash

# Prerequisites
# 1. Change permissions to the script File itself ( chmod 764 postgresql-install.sh )
# 2. Run the script as a sudo user ( sudo ./postgresql-install.sh )


# Installiation of sysvbanner not a must but its easier for visiability

 apt install sysvbanner

# Before the installaition we need to delete old installitions

 apt remove postgresql

 apt remove postgresql postgresql-contrib

 apt autoremove

 apt-get purge postgresql postgresql-14 postgresql-client-common postgresql-common postgresql-contrib

 dpkg -l | grep postgres

 banner uninstallaition completed!


# Now we will install Postgresql

sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
 wget -qO- https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo tee /etc/apt/trusted.gpg.d/pgdg.asc &>/dev/null

# The step above is neccssry since we dont get the postgresql package by default in apt so se need to add the package 
# ourselves 

 apt update

# Updataing apt to use the package we just added 

 apt install postgresql postgresql-client -y
# installaition of the package using apt 


 banner psql --version

# checking the version 


