#!/bin/bash
read -p "Input Card ID: " card_id
regex_pattern="[0-9]{5,8}"
if [[ $card_id =~ $regex_pattern ]]; then
    head -n 2 ./cards_datas.txt
    grep "^$card_id" ./cards_datas.txt 2>/dev/null || echo "Card Not Found!"
else
    echo "Card ID Error!"
fi
