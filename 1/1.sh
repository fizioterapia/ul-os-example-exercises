#!/bin/bash

# Exercise 1
# Print on the screen all users that are currently logged in.
# Format: LOGIN --- NAME --- UID --- (SESSIONS)

IFS=$'\n' # Input Field Separator (https://bash.cyberciti.biz/guide/$IFS)
USERS=`who | tr -s ' ' | cut -d' ' -f1 | sort | uniq -c`
for USER in $USERS; do
    SESSIONS=`echo $USER | tr -s ' ' | cut -d' ' -f2`
    LOGIN=`echo $USER | tr -s ' ' | cut -d' ' -f3`
    DATA=`cat /etc/passwd | iconv -f ISO8859-2 -t UTF-8 | grep ^$LOGIN`
    NAME=`echo $DATA | cut -d':' -f5`
    UUID=`echo $DATA | cut -d':' -f3`
    echo "$LOGIN --- $NAME --- $UUID --- $SESSIONS";
done