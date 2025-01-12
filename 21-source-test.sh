#!/bin/bash

source ./common.sh

echo "Scripts started executing at : $TIMSTAMP" &>>$LOG_FILE_NAME

SOURCE_DIR="/home/ec2-user/app-logs"
FILES_TO_DELETE=$(find $SOURCE_DIR -name "*logs" -mtime +14)
    echo "The Files to be deleted: $FILES_TO_DELETE"

while read -r filepath # filepath is variable name, we can give any name

do 
    echo "deleting file: $filepath" &>>$LOG_FILE_NAME
    rm -rf $filepath
    echo "deleting file: $filepath"
done <<< $FILES_TO_DELETE
