#!/bin/bash

# Exercise 9
# Display on the screen how much
# TCP connections are established
# using stars
# in only one line
# Format:
# Active connections:
# **********
# 10 stars equals 10 connections

while true; do
    STARS=`netstat -apt 2>/dev/null | grep ESTABLISHED | wc -l`

    echo -ne "\r                                                                           \r"
    for i in `seq 1 $STARS`; do
        echo -ne "*"
    done
    sleep 5
done