#!/bin/bash
time /usr/bin/pacman -Ql | cut -d ' ' -f 2- | sort -u > /tmp/db.txt
time find /arch /bin /boot /etc /lib /opt /sbin /usr \
          -path /usr/share/mime -prune -o -path /etc/ssl/certs -prune -o -path /etc/fonts -prune -o -path /usr/share/fonts -prune -o\
					-print 2>/dev/null | while read i; do
	if [ ! -d "$i" ]; then
		echo "$i"
	fi;
done | sort -u > /tmp/fs.txt
time comm -23 /tmp/fs.txt /tmp/db.txt > /tmp/non-db.txt

#test it:
#cat non-db.txt | while read i; do pacman -Qo "$i" 2>&1; done | tee test.txt
less /tmp/non-db.txt
