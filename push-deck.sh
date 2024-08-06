#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
cd "$root_path"
git add ocg/*.ydk
git add 408/*.ydk
git commit -m "push deck"
git push
