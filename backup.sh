#!/bin/bash
# Name: Carlos Santos
# Instructor: Bruce Bolden
# CS 270
# Nov 13, 2019
# This is a script to backup
# files and directories into
# a special subdirectory (.backup)
# all upper cases to lower cases.
# Note to self. Windows ends files with CRLF instead of LF. Make sure to change the in VSC.
#Lets grab the time first
TIME=`date +%H-%M-%S-%b-%d-%y` # %b is month, %d is day, %H is hour, %M is min, %S is sec, %y is year
FILE=backup-$TIME.tar.gz # name of the backupfile that's going to be created
SRCDIR=test # source directory
EXTDIR=test # extract directory
DESDIR=".backup" # destination directory
mkdir -p $DESDIR # create directory if it doesn't exists with the -p
stop=0
while test $stop -eq 0 # check run while stop does not equal 0
do
 cat <<  ENDOFMENU
 1: Backup directory
 2: Extract Backup
 3: Exit     
ENDOFMENU
 echo
 echo -n 'option?: '
 read reply
 echo
 case $reply in
    "1")
        echo "Please enter the directory to back up: "
        read SRCDIR # read in a value from terminal
        echo "Backing up directory: $SRCDIR"
        tar -cvzf $DESDIR/$FILE $SRCDIR
        ;;
    "2")
        echo "Directory to extract: "
        read SRCDIR
        echo "Directory to extract files to: "
        read EXTDIR
        tar -xvzf $SRCDIR -C $EXTDIR
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