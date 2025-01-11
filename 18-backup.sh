#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #if user is not providing number of days, we are taking 14 as default

LOGS_FOLDER="/var/log/expense-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP= $(date +%Y-%m-%d-%H_%M_%S)
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
}

if [ $# -lt 2 ]
then 
    USAGE
fi 

echo "Scripts started executing at : $TIMSTAMP" &>>$LOG_FILE_NAME