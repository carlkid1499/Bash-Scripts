#!/bin/bash
# Name: Carlos Santos
# Instructor: Bruce Bolden
# CS 270
# Nov 13, 2019
# This is a script to add
# or remove line numbers
# from a file
# Note to self. Windows ends files with CRLF instead of LF. Make sure to change the in VSC.
#menu code below
FILE='myfile.txt'
TEMP='temp.txt'
stop=0
while test $stop -eq 0
do
 cat <<  ENDOFMENU
 1: Add line numbers
 2: Remove line numbers
 3: Exit
ENDOFMENU
 echo
 echo -n 'option?: '
 read reply
 echo
 case $reply in
    "1")
        echo "Please enter the file name: "
        read FILE
        echo "Adding line numbers..."
        #Note: awk -F, '{print NR,$0}' $FILE >> $FILE will only append not overwrite
        #Note: awk -F, '{print NR,$0}' $FILE >> temp.txt && mv temp.txt myfile.txt will overwrite the original file with the line numbers
        awk -F, '{print NR,$0}' $FILE >> $TEMP
        mv "$TEMP" "$FILE"
        echo "Showing the numbered file..."
        cat < $FILE
        ;;
    "2")
        echo "Please enter the file name: "
        read FILE
        echo "Removing line numbers..."
        #remove any numberic value and space from the begging of the line
        #the * is used to remove any of something that comes before it
        sed 's/[0-9]*[[:space:]]*//' $FILE >> $TEMP
        mv "$TEMP" "$FILE"
        echo "Showing the un-numbered file..."
        cat < $FILE
        ;;
    "3")
        echo "exiting..."
        stop=1
        ;;
    *)
        echo "illegal choice"
        ;;
 esac
 echo
done