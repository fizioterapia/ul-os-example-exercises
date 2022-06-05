#!/bin/bash

# Exercise 8
# Create file etc.all which will be combination
# of 20 lines of all files that you can read in /etc directory
# before appending etc.all include line with
# format: /* --- file name --- */
# in the end include number of files you readed

ETC_FILES=`find /etc -readable -type f 2>/dev/null`
OUTPUT="etc.all"

IFS=$'\n'
FILES_READ=0

echo "" > $OUTPUT


for FILE in $ETC_FILES; do
    if [ -r $FILE ]; then
        FILE_CONTENT=`head -n 20 $FILE`
        echo "/* --- $FILE --- */" >> $OUTPUT
        echo $FILE_CONTENT >> $OUTPUT

        FILES_READ=`expr $FILES_READ + 1`
    fi
done

echo "Read $FILES_READ files." >> $OUTPUT