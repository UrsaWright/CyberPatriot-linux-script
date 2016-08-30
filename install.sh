#!/bin/bash
#install
apt-get -V -y install firefox 
apt-get -V -y install hardinfo 
apt-get -V -y install chkrootkit 
apt-get -V -y install iptables 
apt-get -V -y install portsentry 
apt-get -V -y install lynis 
apt-get -V -y install ufw 
apt-get -V -y install gufw 
apt-get -V -y install sysv-rc-conf 
apt-get -V -y install clamav 
apt-get -V -y install firestarter
apt-get -V -y install --reinstall coreutils
freshclam
apt-get update
apt-get upgrade
apt-get dist-upgrade
