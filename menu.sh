#!/bin/bash
# menu.sh
# Michael Baum 2/6/2018


flag=0
until [ $flag -ne  0 ]; do
  printf "Welcome to my contact database, please select in the following menu:
  (a) Find a record
  (b) Add a new record
  (c) Update a record
  (d) Remove a record
  (e) List records
  (f) Quit
  > Selection is : "



  read choice
  echo "Your choice was: $choice"
  case "$choice" in
    [aA] ) printf "Search for contact with string: "; read search_string
           if . findRecord.sh "$search_string"; then
              IFS=';' read -ra line <<< "$found_results"
              printf "Contact info:\n"
              for i in "${line[@]}"; do
                IFS=':' read -ra var <<< "$i"
                name="${var[0]}"
                address="${var[1]}"
                phone="${var[2]}"
                email="${var[3]}"
                printf "Name: $name  Address: $address  Phone:  $phone Email: $email\n"
              done
           else
             printf "Contact not found.\n"
           fi;;
    [bB] ) printf "Input contact name: "; read name
           printf "Input contact address: "; read address
           printf "Input contact phone#: "; read phone
           printf "Input contact email: "; read email
           if . addRecord.sh "$name" "$address" "$phone" "$email"; then
             printf "Contact successfully added\n"
           else
             printf "Failure adding contact\n"
           fi;;
    [cC] )  . listRecords.sh
            printf "ID name of contact to update: "; read record_id
            IFS=';' read -ra line <<< "$all_records"
            if [[ "$record_id" -ge 1 && "$record_id" -le "${#line[@]}"-1 ]]; then
              IFS=':' read -ra var <<< "${line["$record_id"]}"
              name="${var[0]}"
              address="${var[1]}"
              phone="${var[2]}"
              email="${var[3]}"
              printf "What do you want to update?\n"
              printf "1. Name\n"
              printf "2. Address\n"
              printf "3. Phone\n"
              printf "4. Email\n"
              printf "Enter choice: "; read update_choice
              case "$update_choice" in 
                [1] ) printf "Enter new name: "; read name
                  . removeRecord.sh "${line["$record_id"]}"
                  echo "${line["$record_id"]}"
                  echo "$name"
                  . addRecord.sh "$name" "$address" "$phone" "$email"
                   printf "Update successful\n";;
                [2] ) printf "Enter new address: "; read address
                  . removeRecord.sh "${line["$record_id"]}"
                  . addRecord.sh "$name" "$address" "$phone" "$email"
                   printf "Update successful\n";;
                [3] ) printf "Enter new phone: "; read phone
                  . removeRecord.sh "${line["$record_id"]}"
                  . addRecord.sh "$name" "$address" "$phone" "$email"
                   printf "Update successful\n";;
                [4] ) printf "Enter new email: "; read email
                  . removeRecord.sh "${line["$record_id"]}"
                  . addRecord.sh "$name" "$address" "$phone" "$email"
                   printf "Update successful\n";;
                * ) printf "Not a valid choice.\n";;
                esac
            else
              printf "Invalid ID\n"
            fi;;
    [dD] ) printf "Input name of contact to remove: "; read name
           if . findRecord.sh "$name" ; then
              IFS=';' read -ra line <<< "$found_results"
              for i in "${line[@]}"; do
                . removeRecord.sh "$i"
              done
             printf "Removal successful\n"
           else
             printf "Contact not found\n"
           fi;;
    [eE] ) printf "Listing contacts:\n"
	    . listRecords.sh
	    ;;
    [fF] ) flag=1;;
    * ) printf "Not a valid choice, please try again.\n";;
  esac
done

exit 0


