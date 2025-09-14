#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
echo "You Can Input q For Abort."
read -p "Input Git Commit Info: " commit_info
if [ "$commit_info" != "q" ]; then
    cd "$root_path"
    git add ocg/*.ydk
    git add mdpro3/*.ydk
    git add 408/*.ydk
    git add 2011_11_11/*.ydk
    git add README.md
    git add .gitignore
    git add *.sh
    git add *.ps1
    git commit -m "$commit_info"
    git push
fi
