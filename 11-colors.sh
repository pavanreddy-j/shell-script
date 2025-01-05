#!/bin/bash

R="\-e[31m"
G="\-e[32m"
Y="\-e[33m"

USERID=$(id -u)
VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo -e "$1  ... $R FAILURE"
        exit 1
    else
        echo -e " $2... $G SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute the scripts"
    exit 1 # other than o
fi

dnf install mysql -y

if [ $? -ne 0 ]
then # not installed
    dnf install mysql -y
    VALIDATE $? "Installing mysql"
else
    echo -e "mysql is already ....$Y Installed"
 fi



dnf install git -y

if [ $? -ne 0 ]
then # not installed
    dnf install git -y
    VALIDATE $? "Installing git"
else
    echo -e "GIT is already ....$Y Installed"
 fi
