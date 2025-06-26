#!/bin/bash

echo "Enter the Number"
read -s Number

if [$Number -gt 100]
then
    echo "$NUMBER gt 100"
else    
    echo "$NUMBER ngt 100"
fi
