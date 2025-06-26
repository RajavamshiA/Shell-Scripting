#!/bin/bash

echo "Enter the Number"
read -s Number

if [ $Number gt 100 ]
then
    echo "gt 100"
else    
    echo "ngt 100"
fi
