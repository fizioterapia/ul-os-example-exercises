#!/bin/bash

# Exercise 5
# Print K most often logged in users in this month.
# K needs to be parameter and integer.

LOGINS=`last -s -$(date +%-d)days | head -n -2  | tr -s ' ' | cut -d' ' -f1 | sort | uniq -c | head -20`

IFS=$'\n'
echo "LOGIN --- NAME --- UID --- LOGINS"
for USER in $LOGINS; do
    LOGINS=`echo $USER | tr -s ' ' | cut -d' ' -f2`
    LOGIN=`echo $USER | tr -s ' ' | cut -d' ' -f3`
    DATA=`cat /etc/passwd | iconv -f ISO8859-2 -t UTF-8 | grep ^$LOGIN`
    NAME=`echo $DATA | cut -d':' -f5`
    UUID=`echo $DATA | cut -d':' -f3`
    echo "$LOGIN --- $NAME --- $UUID --- $LOGINS";
done
