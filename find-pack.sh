#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
pack_path="$root_path/../pack"
#check pack
if [[ ! -e "$root_path/../pack" ]]; then
    echo "$pack_path not found!"
    exit 1
fi

#find pack
read -p "Input Card ID: " card_id
regex_pattern="[0-9]{5,8}"
if [[ $card_id =~ $regex_pattern ]]; then
    grep "^$card_id$" "$pack_path"/* 2>/dev/null || echo "Card ID Not Found!"
else
    echo "Card ID Error!"
fi
