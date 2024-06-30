#!/bin/bash
echo "You Can Input q For Abort."
read -p "Input Git Commit Info: " commit_info
if [ "$commit_info" != "q" ]; then
    git add 408/*
    git add cards_cdb_to_txt.sh
    git add README.md
    git add .gitignore
    git add git_push.sh
    git commit -m "$commit_info"
    git push
fi
