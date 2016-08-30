#!/bin/bash
ping -c4 8.8.8.8
function main {
	
	#set time/date
	now="$(date +'%d/%m/%Y %r')"

	#ensure start-up
	echo " "
	
	cat MTFS.txt
	echo "I'm awake, it's ($now), in my opinion it's too damn early for this"
	echo "run as {sudo xterm -hold -e 'sh MTFS-linux.sh 2>&1 | tee output.log'} to output the console output to a log file."
	echo "Big thanks to JoshuaTatum"

	echo " "

	#manual config edits
#    nano /etc/apt/sources.list	   #check for malicious sources
#    nano /etc/resolv.conf		   #make sure if safe, use 8.8.8.8 for name server
#    nano /etc/hosts  			   #make sure is not redirecting
#    nano /etc/rc.local 			   #should be empty except for 'exit 0'
#    nano /etc/sysctl.conf 		   #change net.ipv4.tcp_syncookies entry from 0 to 1
#    nano /etc/lightdm/lightdm.conf #allow_guest=false, remove autologin
#   nano /etc/ssh/sshd_config 	   #Look for PermitRootLogin and set to no
	
	echo "Manual config edited"
	
	#installs
	apt-get -V -y install firefox hardinfo chkrootkit iptables portsentry lynis ufw gufw sysv-rc-conf nessus clamav firestarter
	apt-get -V -y install --reinstall coreutils
	freshclam
	apt-get update
	apt-get upgrade
	apt-get dist-upgrade
	
	#antivirus
	gnome-terminal -e 'clamscan -i -r --remove=yes / '

	echo "That should de-gunk the processor"

	#network stuff
	iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 23 -j DROP         #Block Telnet
    iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 2049 -j DROP       #Block NFS
    iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 2049 -j DROP       #Block NFS
    iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 6000:6009 -j DROP  #Block X-Windows
    iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 7100 -j DROP       #Block X-Windows font server
    iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 515 -j DROP        #Block printer port
    iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 515 -j DROP        #Block printer port
    iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 111 -j DROP        #Block Sun rpc/NFS
    iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 111 -j DROP        #Block Sun rpc/NFS
    iptables -A INPUT -p all -s localhost  -i eth0 -j DROP            #Deny outside packets from internet which claim to be from your loopback interface.
	ufw enable
	ufw deny 23		#Block Telnet
	ufw deny 2049	#Block NFS
	ufw deny 515	#Block printer port
	ufw deny 111	#Block Sun rpc/NFS
	lsof  -i -n -P
	netstat -tulpn
	
	#media file deletion
    find / -name '*.mp3' -type f -delete
    find / -name '*.mov' -type f -delete
    find / -name '*.mp4' -type f -delete
    find / -name '*.avi' -type f -delete
    find / -name '*.mpg' -type f -delete
    find / -name '*.mpeg' -type f -delete
    find / -name '*.flac' -type f -delete
    find / -name '*.m4a' -type f -delete
    find / -name '*.flv' -type f -delete
    find / -name '*.ogg' -type f -delete
    find /home -name '*.gif' -type f -delete
    find /home -name '*.png' -type f -delete
    find /home -name '*.jpg' -type f -delete
	find /home -name '*.jpeg' -type f -delete
	
	echo "media crap should be gone now"
	
	#user upgrade
	passwd
	passwd -l root
	
	#yo dog heard you like logs, so I put logs in a log so you can log while you log

	gnome-terminal -e 'echo "Whatever we end up doing for a log solution"'


	#show precesses
	gnome-terminal -e 'ps | echo "look through this for anything out of the ordanary"'
	gnome-terminal -e 'top | echo "look through this for anything out of the ordanary"'
	
	#closing
	now="$(date +'%d/%m/%Y %r')"
	echo "I give up, I ran out of stuff to do at ($now)"

}


