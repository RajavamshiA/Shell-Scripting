#!/bin/bash

Number=$1

# -gt, -lt, -ge, -le, -e
if [$Number -gt 100]
then    
    echo "Given number is greater than 100"
else    
    echo "Given number is less than or equal to 100"
fi    
