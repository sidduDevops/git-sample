#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){

if [ $1 -ne 0 ]
    
    then

    echo -e "$R Error::$N $2 is $R FAILED"
    exit 1

    else

    echo " $G $2 is success $N"
fi
}

if [ $ID -ne 0 ]
    then 

    echo "ERROR:: Please run this script with root access"
    exit 1

else

    echo "You are a root user"

fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "Installing MYSQL" 

yum install git -y &>> $LOGFILE

VALIDATE $? "Installing GIT" 

