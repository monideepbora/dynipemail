#!/bin/bash -xv
# Alert IP Address changes over email.

MAIL_TO=monideepbora@hotmail.com
MAIL_SERVER=smtp.gmail.com:587
MAIL_FROM=monideepbora.aec@gmail.com
USERNAME=monideepbora.aec@gmail.com
PASSWORD=<password>
SUBJECT="IP CHANGE NOTIFICATION"

LOG=/home/dpom/bash/ipadd.txt
NOW=$(date +"%T %m-%d-%Y")


#if [[ -s $LOG ]];
#then
#echo "file has data"
#else
#exit
#fi



if [ -f $LOG ]; then
OLD_IP=$(cat $LOG)
else
OLD_IP=
fi


NEW_IP=$(sudo grep -E -o "r:([0-9]{1,3}[\.]){3}[0-9]{1,3}" /home/dpom/bash/ip.log)

while [ "$NEW_IP" ==  "" ]
do

#if [ "$NEW_IP" == " " ]
#then
NEW_IP=$(sudo grep -E -o "r:([0-9]{1,3}[\.]){3}[0-9]{1,3}" /home/dpom/bash/ip.log)
#fi
done
# Get IP Address


# Check for Change



if [ "$NEW_IP" != "$OLD_IP" ]
then

    # log current ip
    echo $NEW_IP > $LOG	

    # Send Email
    sendEmail -v -f $MAIL_FROM -s $MAIL_SERVER -xu $USERNAME -xp $PASSWORD -t $MAIL_TO -o tls=yes -u $NEW_IP $NOW  -m $NEW_IP $NOW -a /home/dpom/bash/snr.txt
    logger -t ipcheck -- IP changed to $NEW_IP


else
echo "NO CHANGE"
exit 0

fi
