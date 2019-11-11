#!/bin/bash
# Name: Carlos Santos
# Instructor: Bruce Bolden
# CS 270
# Nov 13, 2019
# This is a script to change
# file names. It will remove any
# underscores. And it will make
# all upper cases to lower cases.
# Note to self. Windows ends files with CRLF instead of LF. Make sure to change the in VSC.
#FILE name variable
FILE='myfile.txt'

stop=0
while test $stop -eq 0
do
 cat <<  ENDOFMENU
 1: Enter File Name
 2: Exit
ENDOFMENU
 echo
 echo -n 'option?: '
 read reply
 echo
 case $reply in
    "1")
        echo "Enter the file name you wish to be renamed"
        read FILE
        TEMP=$FILE
        echo "File name entered: $FILE"
        echo
        FILE=$(sed 's/[_]//g' <<< $FILE)
        FILE=$(sed 's/[A-Z]/\L&/g' <<< $FILE)
        echo "Result..."
        echo $FILE
        echo
        mv "$TEMP" "$FILE"
        ls -l
        ;;
    "2")
        echo "exiting..."
        stop=1
        ;;
    *)
        echo "illegal choice"
        ;;
 esac
 echo
done