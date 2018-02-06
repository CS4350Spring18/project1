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
    [aA] ) printf "Search for Contact with name: "; read name;
           ./displayRecord.sh $name;;
    [bB] ) printf "Input contact name: "; read name; 
           printf "Input contact address: "; read address;
           printf "Input contact phone#: "; read phone;
           printf "Input contact email: "; read email; 
           if [ ./addRecord.sh $name $address $phone $email ]; then
             printf "Contact successfully added\n"
           else
             printf "Failure adding contact\n"
           fi;;
    [cC] ) ./updateRecord.sh;;
    [dD] ) ./removeRecord.sh;;
    [eE] ) flag=1;;
    * ) printf "Not a valid choice, please try again.\n";;
  esac
done

exit 0


