#!/bin/bash

USERID=$(id -u)

if [$USERID -ne 0]
then
    echo "ERROR::You must have sudo access to execute this script"
    exit 1 #other than 0
fi

dnf list installed mysql

if [$? -ne 0]
then # not installed
    dnf install mysql -y
    if [$? -ne 0]
    then 
        echo "Installing Mysql... Failure"
    else
        echo "Installing Mysql...Success"
    fi
else
    echo "Mysql is already installed"
fi



dnf list installed git

if [$? -ne 0 ]
then # not installed
    dnf install git -y
    if [$? -ne 0]
    then 
        echo "Installing Git... Failure"
    else
        echo "Installing Git...Success"
    fi
else
    echo "Git is already installed"
fi