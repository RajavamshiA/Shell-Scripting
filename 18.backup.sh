#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # If user is not providing the number of days, we are taking 14 as default. 

LOGS_FOLDER="/home/ec2-user/shellscript-logs/"
LOG_FILE=$(echo $0 | awk -F "/" '{print $NF}' | cut -d "." -f1) #It gives the name of the script
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

USAGE(){
    echo -e "$R USAGE:: $N backup <SOURCE_DIR> <DEST_DIR> <DAYS(Optional)>"
    exit 1
}

mkdir -p /home/ec2-user/shellscript-logs

if [ $# -lt 2 ]
then   
    USAGE
fi

if [ ! -d "$SOURCE_DIR" ]
then
    echo "$SOURCE_DIR  Does not Exist.. Please Check"
    exit 1
fi

if [ ! -d "$DEST_DIR" ]
then
    echo "$DEST_DIR  Does not Exist.. Please Check"
    exit 1
fi

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS) 

if [ -n "$FILES" ] #true if there are files to zip
then
    echo "Files are: $FILES"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"
    if [ -f "$ZIP_FILE" ]
    then
        echo -e "$G Successfully created zip file for files older than $DAYS"
        while read -r filepath #here filepath is the varialble name, we can give any name
        do
            echo "Deleting files:$filepath" &>>$LOG_FILE_NAME
            rm -rf $filepath
            echo "Deleted files:$filepath"
        done <<< $FILES
    else
        echo -e "$R Error::$N Failed to create ZIP file"  
        exit 1
    fi       
else
    echo "No files are found older than $DAYS"
fi
