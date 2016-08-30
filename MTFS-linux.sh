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
	#config-edit
	sh config-edits.sh
	echo "Manual config edited"
	#antivirus
	sh antivirus.sh
	echo "That should de-gunk the processor"
	#network stuff
	sh network.sh
	#media file deletion
	sh media.sh
	echo "media crap should be gone now"
	#user upgrade
		#passwd
		#passwd -l root
	
	#yo dog heard you like logs, so I put logs in a log so you can log while you log

	gnome-terminal -e 'echo "Whatever we end up doing for a log solution"'


	#show precesses
	xterm -hold -e 'ps | echo "look through this for anything out of the ordanary"'
	xterm -hold -e 'top | echo "look through this for anything out of the ordanary"'
	
	#closing
	now="$(date +'%d/%m/%Y %r')"
	echo "I give up, I ran out of stuff to do at ($now)"

}


