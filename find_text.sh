#!/bin/bash
read -p "Input Regex Pattern: " regex_pattern
grep "$regex_pattern" ./cards_texts.txt 2>/dev/null || echo "Card Not Found!"
