#!/bin/bash/
#manual config edits
#    nano /etc/apt/sources.list	   #check for malicious sources
#    nano /etc/resolv.conf		   #make sure if safe, use 8.8.8.8 for name server
#    nano /etc/hosts  			   #make sure is not redirecting
#    nano /etc/rc.local 			   #should be empty except for 'exit 0'
#    nano /etc/sysctl.conf 		   #change net.ipv4.tcp_syncookies entry from 0 to 1
#    nano /etc/lightdm/lightdm.conf #allow_guest=false, remove autologin
#   nano /etc/ssh/sshd_config 	   #Look for PermitRootLogin and set to no
