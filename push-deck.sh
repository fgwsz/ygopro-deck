#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
cd "$root_path"

if [ git status --porcelain | grep -E '^(.. )?((ocg|408|2011_11_11)/.*\.ydk$|(ocg|408|2011_11_11)/.*\.ydk$)' >/dev/null ]; then
    git add -A ocg/*.ydk 408/*.ydk 2011_11_11/*.ydk
    echo "卡组未变更"
    git commit -m "自动提交卡组变更"
    git push
fi
