#!/bin/bash
# removeRecord.sh
# James Garrison 2/12/2018

NAME=$1

sed -i  "/$NAME/d" contacts.data

if [ $? ]; then
	EXIT_CODE=true
else
	EXIT_CODE=false
fi

$EXIT_CODE
