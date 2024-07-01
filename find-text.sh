#!/bin/bash

cards_texts_path="./cards-texts.txt"

if [[ ! -e "$cards_texts_path" ]]; then
    ./cards_cdb_to_txt.sh
fi

use_last_result=false
last_result=""
is_found=false

while true
do
    read -p "Input Regex Pattern: " regex_pattern
    if $use_last_result; then
        last_result=$(grep "$regex_pattern" <<< "$last_result" 2>/dev/null)
    else
        last_result=$(grep "$regex_pattern" "$cards_texts_path" 2>/dev/null)
    fi
    if [[ -z $last_result ]]; then
        is_found=false
        echo "Cards Not Found!"
    else
        is_found=true
        echo "$last_result"
    fi
    read -p "Exit?(Y/n): " user_command
    if [[ $user_command == "Y" || $user_command == "y" ]]; then
        break
    fi
    if ! $is_found; then
        use_last_result=false
        continue
    fi
    read -p "Use Last Result?(Y/n): " user_command
    if [[ $user_command == "Y" || $user_command == "y" ]]; then
        use_last_result=true
    else
        use_last_result=false
    fi
done
