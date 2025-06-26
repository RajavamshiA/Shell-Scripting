#!/bin/bash

echo "All variables passed: $@"
echo "Number of variables: $#"
echo "Script Name: $0"
echo "Present Working Directory: $PWD"
echo "Home directory of Current User: $HOME"
echo "Which user is running this script: $$"
sleep 60 &
echo "Process id of last command in background: $!"

$@
$#
$PWD
$HOME
$$
$! 


