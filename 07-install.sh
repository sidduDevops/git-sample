#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
    then 

    echo "ERROR:: Please run this script with root access"
    exit 1

else

    echo "You are a root user"

fi

yum install mysql -y

if [ $? -ne 0 ]
    
    then

    echo "Error::Installing MYSQL is FAILED"
    exit 1

    else

    echo "Instaalling MYSQL is success"
fi