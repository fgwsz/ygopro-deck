#!/bin/bash

cards_datas_path="./cards-datas.txt"

read -p "Input Card ID: " card_id

regex_pattern="[0-9]{5,8}"

if [[ $card_id =~ $regex_pattern ]]; then
    if [[ ! -e "$cards_datas_path" ]]; then
        ./cards_cdb_to_txt.sh
    fi
    head -n 2 "$cards_datas_path"
    grep "^$card_id" "$cards_datas_path" 2>/dev/null || echo "Card Not Found!"
else
    echo "Card ID Error!"
fi
