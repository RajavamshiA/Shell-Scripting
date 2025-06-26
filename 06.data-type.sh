#!/bin/bash


NUMBER1=$1
NUMBER2=$2

TIMESTAMP=$(date) # Running the command inside the shell script
echo "Script executed at: $TIMESTAMP"
SUM=$(($NUMBER1+$NUMBER2))

echo "Sum of $NUMBER1 AND $NUMBER2 is: $SUM"