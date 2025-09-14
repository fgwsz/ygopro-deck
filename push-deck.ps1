$root_path = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location $root_path

git add -A
git status
git add ocg/*.ydk, mdpro3/*.ydk, 408/*.ydk, 2011_11_11/*.ydk
git commit -m "自动提交卡组变更"
git push
