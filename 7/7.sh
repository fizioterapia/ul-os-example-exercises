#!/bin/bash

# Exercise 7
# Write to a file called unlogged.list in home dir
# users which UID is in range from L to P
# which did not logged in in the last N times
# to the system.
# L, P and N needs to be parameters
# Format: LOGIN --- NAME --- UID

if [ $# -lt 3 ]; then
    echo "Usage: $0 <times> <from> <to>"
    exit
fi

TIMES=$1
FROM=$2
TO=$3
LASTLOGINS=`last -n$TIMES`

echo "LOGIN --- NAME --- UID" > notloggedin.list
for ID in `seq $FROM $TO`; do
    EXISTS=`id $ID 2>/dev/null`
    if [ ${#EXISTS} -gt 0 ]; then
        USERNAME=`echo $EXISTS | cut -d'(' -f2 | cut -d')' -f1`
        LOGGED=`echo "$LASTLOGINS" | grep "^$USERNAME"`
        DATA=`cat /etc/passwd | iconv -f ISO8859-2 -t UTF-8 | grep ^$USERNAME`
        NAME=`echo $DATA | cut -d':' -f5`
        if [ ${#LOGGED} -eq 0 ]; then
            echo "$USERNAME --- $NAME --- $ID" >> notloggedin.list
        fi
    fi 
done