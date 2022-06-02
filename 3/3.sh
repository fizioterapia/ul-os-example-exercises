#!/bin/bash

# Exercise 3
# Print on the screen all files that begin on letter P
# which P is variable put during execution of a script.
# Find those files in directories that are put as another parameters during execution.
# Script needs to be closed, when there is no more than 2 parameters.
# Format: <dir name> --- <files in dir name> --- <size of all files>

if [ $# -lt 2 ]; then
    echo "Usage: $0 <letter> <dirs>"
    exit 1
fi

LETTER=$1;
shift;
echo "<dir name> --- <files in dir name> --- <size of all files>"
while [ $# -gt 0 ]; do
    DIRNAME=$1;
    SIZE=0
    FILES=`find $DIRNAME/$LETTER* -type f 2>/dev/null`
    COUNT=0
    for FILE in $FILES; do
        FILESIZE=`du -sb $FILE | cut -f1`
        SIZE=`expr $SIZE + $FILESIZE`
        COUNT=`expr $COUNT + 1`
    done
    echo $DIRNAME --- $COUNT --- $SIZE
    shift;
done