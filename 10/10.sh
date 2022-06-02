#!/bin/bash

# Exercise 10
# Print to stdout list of all files in /etc directory
# that you can read, before file name you need
# to include two numbers
# one is the number of lines
# and the second one is number of lines without
# comments

FILES=`find /etc -type f -readable 2>/dev/null`
IRS=$'\n'
for FILE in $FILES; do
    LINES=`cat $FILE | wc -l`
    LINESCLEAN=`cat $FILE | grep -v "^#" | wc -l`

    echo $LINES $LINESCLEAN $FILE
done