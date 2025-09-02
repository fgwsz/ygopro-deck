#!/usr/bin/env pwsh

# 获取脚本所在目录的绝对路径
$root_path = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location $root_path

# 检查变更（包括未暂存、未跟踪的文件）
$stagedChanges = git diff --quiet --cached
$unstagedChanges = git diff --quiet

if ($LASTEXITCODE -eq 0 -and $unstagedChanges -eq 0) {
    Write-Output "卡组未变更"
    exit 0
}

# 提交并推送
git status
git add -A ocg/*.ydk, 408/*.ydk, 2011_11_11/*.ydk
git commit -m "自动提交卡组变更"
git push
