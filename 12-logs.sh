#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP= $(date +%Y-%m-%d-%H_%M_%S)
LOG_FILE_NAME="$$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo -e "$1  ... $R FAILURE $N"
        exit 1
    else
        echo -e " $2... $G SUCCESS $N"
    fi
}

echo "Scripts started executing at : $TIMSTAMP" &>>LOG_FILE_NAME

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute the scripts"
    exit 1 # other than o
fi

dnf install mysql -y &>>LOG_FILE_NAME

if [ $? -ne 0 ]
then # not installed
    dnf install mysql -y &>>LOG_FILE_NAME
    VALIDATE $? "Installing mysql"
else
    echo -e "mysql is already ....$Y Installed $N"
 fi



dnf install git -y &>>LOG_FILE_NAME

if [ $? -ne 0 ]
then # not installed
    dnf install git -y &>>LOG_FILE_NAME
    VALIDATE $? "Installing git"
else
    echo -e "GIT is already ....$Y Installed $N"
 fi
