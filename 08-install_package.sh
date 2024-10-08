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

    echo -e "  $2 is $G success $N"
fi
}

if [ $ID -ne 0 ]
    then 

    echo "ERROR:: Please run this script with root access"
    exit 1

else

    echo "You are a root user"

fi

for package in $@
 
 do 
     yum list installed $package
        if [ $? -ne 0 ]
        then
            yum install $package -y &>> $LOGFILE
            VALIDATE $? "Installing $package"
        else
            echo -e "Already installed $G Skipping $N"

        fi
    
 done


