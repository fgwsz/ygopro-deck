#!/bin/bash

if [[ ! -e "../cards.cdb" ]]; then
    echo "../cards.cdb not found!"
    exit 1
fi

#create cards-datas.txt
if [[ -e "./cards-datas.txt" ]]; then
    rm -rf ./cards-datas.txt
fi
touch ./cards-datas.txt
sqlite3 ../cards.cdb << EOF
.mode column
.output ./cards-datas.txt
SELECT * FROM datas;
.exit
EOF

#create cards-texts.txt
if [[ -e "./cards-texts.txt" ]]; then
    rm -rf ./cards-texts.txt
fi
touch ./cards-texts.txt
sqlite3 ../cards.cdb << EOF
.output ./cards-texts.txt
SELECT * FROM texts;
.exit
EOF

#handle cards-texts.txt
vim -c "%s/\r\n//g" -c "%s/||//g" -c "wq!" ./cards-texts.txt

#set readonly
chmod a-w ./cards-datas.txt
chmod a-w ./cards-texts.txt
