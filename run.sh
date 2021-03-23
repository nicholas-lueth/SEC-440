#!/bin/bash
sudo adduser nick
sudo usermod -aG sudo nick
sudo -i
mv 00-installer-config.yaml /etc/netplan/
netplan apply
apt-get update
apt-get upgrade
apt-get install keepalived -y
apt install mariadb-server -y
mysql_secure_installation
vi /etc/mysql/mariadb.conf.d/50-server.cnf
mv keepalived.conf /etc/keepalived/
systemctl restart mysql
ufw allow mysql
mysql -u root -p
