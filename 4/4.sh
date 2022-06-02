#!/bin/bash

# Exercise 4
# Check if string is palindrome.

STRING=`echo $@ | tr "[:upper:]" "[:lower:]" | tr -d "[:blank:]" | tr -d "[:punct:]"`
REVSTRING=`echo $STRING | rev`
if [ $STRING == $REVSTRING ]; then
    echo "$@ is palindrome"
else
    echo "$@ is not palindrome"
fi