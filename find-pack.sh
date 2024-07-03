#!/bin/bash

#check pack
if [[ ! -e "../pack" ]]; then
    echo "../pack not found!"
    exit 1
fi

#find pack
read -p "Input Card ID: " card_id
regex_pattern="[0-9]{5,8}"
if [[ $card_id =~ $regex_pattern ]]; then
    grep "^$card_id$" ../pack/* 2>/dev/null || echo "Card ID Not Found!"
else
    echo "Card ID Error!"
fi
