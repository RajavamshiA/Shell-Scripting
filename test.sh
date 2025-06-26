#!/bin/bash

echo "Enter the Number"
read -s Number      

if [ $Number -gt 100 ]
then
    echo "$Number is greater than 100"
else    
    echo "$Number is not greater than 100"
fi
