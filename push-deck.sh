#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
cd "$root_path"

git add -A
if git status --porcelain | grep -E '^(.. )?((ocg|408|2011_11_11)/.*\.ydk$|(ocg|408|2011_11_11)/.*\.ydk$)' >/dev/null; then
    git status
    git add ocg/*.ydk 408/*.ydk 2011_11_11/*.ydk
    git commit -m "自动提交卡组变更"
    git push
else
    echo "卡组未变更"
fi
