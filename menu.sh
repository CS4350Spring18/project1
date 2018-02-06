#!/bin/bash
# menu.sh
# Michael Baum 2/6/2018


flag=0
until [ $flag -ne  0 ]; do
  printf "Welcome to my contact database, please select in the following menu:
  (a) Find a new record
  (b) Add a new record
  (c) Update a record
  (d) Remove a record
  (e) Quit
  > Selection is : "

  read choice
  echo "Your choice was: $choice"
  case "$choice" in
    [aA] ) printf "Search for Contact with name: "; read name
           if [ . findRecord.sh "$name" ]; then
             printf "Contact info:\n  Name: $name\n  Address: $address\n  Phone:  $phone\n Email: $email\n"
           else
             printf "Contact not found.\n"
           fi;;
    [bB] ) printf "Input contact name: "; read name
           printf "Input contact address: "; read address
           printf "Input contact phone#: "; read phone
           printf "Input contact email: "; read email 
           if [ . addRecord.sh "$name" "$address" "$phone" "$email" ]; then
             printf "Contact successfully added\n"
           else
             printf "Failure adding contact\n"
           fi;;
    [cC] ) printf "Input name of contact to change: "; read name
           if [ . findRecord.sh "$name" ]; then
             . removeRecord.sh "$name"
             . addRecord.sh "$name" "$address" "$phone" "$email"
             printf "Update successful\n"
           else
             printf "Contact not found.\n"
           fi;;
    [dD] ) printf "Input name of contact to remove: "; read name
           if [ . findRecord.sh "$name" ]; then
             . removeRecord.sh "$name"
             printf "Removal successful\n"
           else
             printf "Contact not found\n"
           fi;;
    [eE] ) flag=1;;
    * ) printf "Not a valid choice, please try again.\n";;
  esac
done

exit 0


