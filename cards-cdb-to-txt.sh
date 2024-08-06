#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
cards_cdb_path="$root_path/../cards.cdb"

#check cards cdb
if [[ ! -e "$cards_cdb_path" ]]; then
    echo "$cards_cdb_path not found!"
    exit 1
fi

cards_datas_path="$root_path/cards-datas.txt"
cards_texts_path="$root_path/cards-texts.txt"

#create cards-datas.txt
if [[ -e "$cards_datas_path" ]]; then
    rm -rf "$cards_datas_path"
fi
touch "$cards_datas_path"
sqlite3 "$cards_cdb_path" << EOF
.mode column
.output "$cards_datas_path"
SELECT * FROM datas;
.exit
EOF

#create cards-texts.txt
if [[ -e "$cards_texts_path" ]]; then
    rm -rf "$cards_texts_path"
fi
touch "$cards_texts_path"
sqlite3 "$cards_cdb_path" << EOF
.output "$cards_texts_path"
SELECT * FROM texts;
.exit
EOF

#handle cards-texts.txt
vim -c "%s/\r\n//g" -c "%s/||//g" -c "wq!" "$cards_texts_path"

#set readonly
chmod a-w "$cards_datas_path"
chmod a-w "$cards_texts_path"
