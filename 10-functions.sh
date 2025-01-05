#!/bin/bash

USERID=$(id -u)
VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo "$1  ...FAILURE"
        exit 1
    else
        echo " $2... SUCCESS"
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
    echo "mysql is already ....Installed"
 fi



dnf install git -y

if [ $? -ne 0 ]
then # not installed
    dnf install git -y
    VALIDATE $? "Installing git"
else
    echo "GIT is already ....Installed"
 fi
