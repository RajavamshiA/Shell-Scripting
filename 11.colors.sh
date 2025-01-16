#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2... $R Failure"
    else
        echo -e "$2... $G Success"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR::You must have sudo access to execute this script"
    exit 1 #other than 0
fi



dnf list installed mysql 

if [ $? -ne 0 ]
then # not installed
    dnf install mysql -y
    VALIDATE $? "Installing Mysql"
else
    echo -e "Mysql is already $Y installed"
fi



dnf list installed git

if [ $? -ne 0 ]
then # not installed
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo -e "Git is already $Y installed"
fi