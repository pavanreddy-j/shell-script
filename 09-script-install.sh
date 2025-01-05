#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute the scripts"
    exit 1 # other than o
fi

dnf install mysql -y

if [ $? -ne 0 ]
then 
    echo "Installing mysql ...FAILURE"
    exit 1
else
    echo "Insatlling mysql ... SUCCESS"
fi