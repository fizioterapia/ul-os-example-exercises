#!/bin/bash

# Exercise 11
# Write to a file being first parameter
# list of all processes working longer
# than second parameter being minutes.
# Ignore processes which have month/day.
# Format: PID PROCESS_NAME STIME OWNER

if [ $# -lt 2 ]; then
    echo "Usage: $0 <filename> <minutes>"
    exit
fi

FILENAME=$1
MIN=$2
PROCESSES=`ps -ux | tr -s ' ' | tail -n +2`

echo "" > $FILENAME

IFS=$'\n'
for PROCESS in $PROCESSES; do
    TIME=`echo $PROCESS | cut -d' ' -f9`
    RESULT=`echo $TIME | grep ":"`

    if [ ${#RESULT} -gt 0 ]; then
        HOURS=`echo $TIME | cut -d':' -f1`
        MINUTES=`echo $TIME | cut -d':' -f2`
        CURHOUR=`date +%H`
        CURMIN=`date +%M`
        OWNER=`echo $PROCESS | cut -d' ' -f1`
        CMD=`echo $PROCESS | cut -d' ' -f11`
        PID=`echo $PROCESS | cut -d' ' -f2`

        if [ $HOURS -eq $CURHOUR ]; then
            MINUTES=`expr $CURMIN - $MINUTES`

            if [ $MINUTES -gt $MIN ]; then
                HOURS="00"
                if [ $MINUTES -lt 10 ]; then
                    MINUTES="0$MINUTES"
                fi

                echo "$PID $CMD $HOURS:$MINUTES $OWNER" >> $FILENAME
            fi
        else
            REALHOURS=`expr $CURHOUR - $HOURS`
            NMINUTES=`expr $REALHOURS \* 60`
            NMINUTES=`expr $NMINUTES + $MINUTES`

            if [ $NMINUTES -gt $MIN ]; then
                PHOURS=`expr $NMINUTES / 60`
                PHOURSMIN=`expr $PHOURS \* 60`
                NMINUTES=`expr $NMINUTES - $PHOURSMIN`
                if [ $PHOURS -lt 10 ]; then
                    PHOURS="0$PHOURS"
                fi

                if [ $NMINUTES -lt 10 ]; then
                    NMINUTES="0$NMINUTES"
                fi

                echo "$PID $CMD $PHOURS:$NMINUTES $OWNER" >> $FILENAME
            fi
        fi
    fi
done