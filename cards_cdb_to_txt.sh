#!/bin/bash
#creat cards_datas.txt
rm -rf ./cards_datas.txt
touch ./cards_datas.txt
sqlite3 ../cards.cdb << EOF
.mode column
.output ./cards_datas.txt
SELECT * FROM datas;
.exit
EOF
#creat cards_texts.txt
rm -rf ./cards_texts.txt
touch ./cards_texts.txt
sqlite3 ../cards.cdb << EOF
.output ./cards_texts.txt
SELECT * FROM texts;
.exit
EOF
#handle cards_texts.txt
vim -c "%s/\n//g" -c "%s/||//g" -c "wq!" ./cards_texts.txt
#set readonly
chmod -w cards_datas.txt
chmod -w cards_texts.txt
