#!/bin/bash

ID=$(id -u)

VALIDATE(){

if [ $1 -ne 0 ]
    
    then

    echo "Error::Installing $2 is FAILED"
    exit 1

    else

    echo "Installing $2 is success"
fi
}

if [ $ID -ne 0 ]
    then 

    echo "ERROR:: Please run this script with root access"
    exit 1

else

    echo "You are a root user"

fi

yum install mysql -y

VALIDATE $? "Installing MYSQL"

yum install git -y

VALIDATE $? "Installing GIT"

