#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute the scripts"
    exit 1 # other than o
fi

dnf install mysql -y

if [ $? -ne 0 ]
then # not installed
    dnf install mysql -y
    if [ $? -ne 0 ]
        echo "Installing mysql ...FAILURE"
        exit 1
        
    else
        echo "Insatlling mysql ... SUCCESS"
    fi
else
    echo "my sql is already ....Installed"
 fi


# if [ $? -ne 0 ]
# then 
#     echo "Installing mysql ...FAILURE"
#     exit 1
# else
#     echo "Insatlling mysql ... SUCCESS"
# fi


dnf install git -y

if [ $? -ne 0 ]
then 
    echo "Installing GIT ...FAILURE"
    exit 1
else
    echo "Insatlling GIT ... SUCCESS"
fi