#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THERSHOLD=5 # real projects monitor for 70
MSG=""

while read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THERSHOLD ]
    then 
        MSG+="High disk usage on partition: $PARTITION Usage is: $USAGE \n"
    fi
done <<< $DISK_USAGE

echo -e "Message:$MSG"

echo "$MSG" | mutt -s "High disk usage" rajavamshiankam@gmail.com           