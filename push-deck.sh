#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
cd "$root_path"

git add -A ocg/*.ydk 408/*.ydk 2011_11_11/*.ydk
if [ -z "$(git status --porcelain)" ]; then
    echo "卡组未变更"
    exit 0
fi
git commit -m "自动提交卡组变更"
git push
