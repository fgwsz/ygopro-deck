#!/bin/bash
#create cards-datas.txt
rm -rf ./cards-datas.txt
touch ./cards-datas.txt
sqlite3 ../cards.cdb << EOF
.mode column
.output ./cards-datas.txt
SELECT * FROM datas;
.exit
EOF
#create cards-texts.txt
rm -rf ./cards-texts.txt
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
