#!/bin/sh

pgrep nginx &> /dev/null
if [ $? != 0 ]
then
    echo "Service nginx failed. Restarting pod..."
	exit 1
fi
pgrep php &> /dev/null
if [ $? != 0 ]
then
    echo "Service php failed. Restarting pod..."
	exit 1
fi
pgrep ssh &> /dev/null 
if [ $? != 0 ]
then
    echo "Service ssh failed. Restarting pod..."
	exit 1
fi