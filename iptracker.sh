#! /bin/bash

#script to keep track of external server ip

#variable for old ip from the file. If this is the first time setting this up, do a touch on the file just so it has something there. 
#ADDITIONALLY - I have mine set up to save to a dropbox folder so even if I don't get the email, I have the source file and can change my dns. 
oldip=$(awk '{print $8}' ~/Dropbox/IPADDRESS/IPADDRESS.TXT)

#variable for current ip
#read online this was a good way of checkig your public ip
newip=$(curl -s ipinfo.io/ip)

#date variable
mydate=$(date "+%x %r")

#ACTUAL CODE
#CHANGE YOU@EMAIL.COM
#CHANGE FROM@EMAIL.COM
#MAKE SURE YOU HAVE YOUR DROPBOX DIRECTORY SET UP

if [ "$oldip" != "$newip" ] && [ ! -z $oldip ] && [ ! -z $newip ] ; then
echo "Old IP $oldip became NEW IP $newip" | mail -s "Your server IP changed on  $mydate" YOU@EMAIL.COM -aFrom:FROM@EMAIL.COM
rm ~/Dropbox/IPADDRESS/IPADDRESS.TXT
echo "IP checked on $mydate is $newip" > ~/Dropbox/IPADDRESS/IPADDRESS.TXT
fi
