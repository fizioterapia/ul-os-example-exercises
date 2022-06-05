#!/bin/bash

# Exercise 6
# Create script which every K seconds
# will append file called /tmp/changes
# UID of users, which ended sessions
# or started sessions in this timeframe
# Format:
# ---
# $HOUR
# ---
# uid

LAST_WHO="who.txt"
LIST="list.txt"

while true; do
    IFS=$'\n'
    NEW_USERS=`who | tr -s " " | cut -d" " -f1 | uniq`;

    echo "---" >> $LIST
    echo "$(date +%H:%M:%S)" >> $LIST
    echo "---" >> $LIST

    for USER in `cat $LAST_WHO`; do
        OUTPUT=`cat $LAST_WHO | grep $USER`
        LENGTH=${#OUTPUT} # length of string
        NEWOUTPUT=`echo $NEW_USERS | grep $USER`
        NEWLENGTH=${#NEWOUTPUT}

        if [[ ($LENGTH -gt 0 && $NEWLENGTH -eq 0) ]]; then
            echo `id $USER | cut -d'(' -f1 | cut -d'=' -f2` >> $LIST
        fi
    done

    for USER in $NEW_USERS; do
        OUTPUT=`cat $LAST_WHO | grep $USER`
        LENGTH=${#OUTPUT} # length of string
        NEWOUTPUT=`echo $NEW_USERS | grep $USER`
        NEWLENGTH=${#NEWOUTPUT}

        if [[ ($LENGTH -eq 0 && $NEWLENGTH -gt 0) ]]; then
            echo `id $USER | cut -d'(' -f1 | cut -d'=' -f2` >> $LIST
        fi
    done

    echo "$NEW_USERS" > $LAST_WHO

    sleep 5
done