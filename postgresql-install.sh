#!/bin/bash

# Prerequisites
# 1. Change permissions to the script File ( chmod 764 postgresql-install.sh )
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


 banner `psql --version`

# checking the version 

# change {YourVersion} to your real version

 cd /etc/postgresql/{YourVersion}/main/

echo 'local   all             postgres                                trust

 TYPE  DATABASE        USER            ADDRESS                 METHOD

"local" is for Unix domain socket connections only
local   all             all                                     trust
# IPv4 local connections:
host    all             all             127.0.0.1/32            trust
# IPv6 local connections:
host    all             all             ::1/128                 trust
# Allow replication connections from localhost, by a user with the
# replication privilege.
local   replication     all                                     trust
host    replication     all             127.0.0.1/32            trust
host    replication     all             ::1/128                 trust
' > pg_hba.conf

# Then write psql -U postgres and in the shell itself perform the nexgt action 
# CREATE USER new_username WITH PASSWORD 'new_password';

# After succesfully excutaing the previous step, then we reset 
# echo 
# 'local   all             postgres                                md5
#
# # TYPE  DATABASE        USER            ADDRESS                 METHOD
#
# # "local" is for Unix domain socket connections only
# local   all             all                                     md5
# # IPv4 local connections:
# host    all             all             127.0.0.1/32            md5
# # IPv6 local connections:
# host    all             all             ::1/128                 md5
# # Allow replication connections from localhost, by a user with the
# # replication privilege.
# local   replication     all                                     md5
# host    replication     all             127.0.0.1/32            md5
# host    replication     all             ::1/128                 md5
# ' > pg_hba.conf

# then to enter the shell in a secure manner, use "psql -U 'yourUserName'"
