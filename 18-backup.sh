#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #if user is not providing number of days, we are taking 14 as default

LOGS_FOLDER="/home/ec2-user/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H_%M_%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo -e "$1  ... $R FAILURE $N"
        exit 1
    else
        echo -e " $2... $G SUCCESS $N"
    fi
}

USAGE(){
    echo  -e "$R USAGE:: $N sh 18-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS(Optional)>"
    exit 1
}

mkdir -p /home/ec2-user/shellscript-logs/

if [ $# -lt 2 ]
then 
    USAGE
fi 

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR does not exist ..please check"
    exit 1
fi

if [ ! -d $DEST_DIR ]
then
    echo -e "$DEST_DIR does not exist ..please check"
    exit 1
fi

echo "Scripts started executing at : $TIMSTAMP" &>>$LOG_FILE_NAME

FILES=$(find $SOURCE_DIR -name  "*.log" -mtime +$DAYS)

echo "files are: $FILES"

if [ -n FILES ]  # true if there are files to zip
then
    echo "files are: $FILES"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMSTAMP.zip"
    find $SOURCE_DIR -name  "*.log" -mtime +$DAYS |zip -@ "$ZIP_FILE"
    if [ -f "$ZIP_FILE" ]
    then
        echo -e " Successfully Zip file is created for older than $DAYS"
        while read -r filepath # filepath is variable name, we can give any name
            do 
                echo "deleting file: $filepath" &>>$LOG_FILE_NAME
                rm -rf $filepath
                echo "deleting file: $filepath"
            done
    else
        echo -e "$R Error:: $N Failed to create ZIP files"
        exit 1
    fi 
else
    echo "No files found orlder than $DAYS"
fi 
