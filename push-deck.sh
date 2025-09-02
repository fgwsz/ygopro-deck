#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
cd "$root_path"

# 检查变更（包括未暂存、未跟踪的文件）
if git diff --quiet --cached && git diff --quiet; then
    echo "卡组未变更"
    exit 0
fi

# 提交并推送
git status
git add -A ocg/*.ydk 408/*.ydk 2011_11_11/*.ydk
git commit -m "自动提交卡组变更"
git push
