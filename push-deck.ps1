$root_path = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location $root_path

git add -A

$hasChanges = git status --porcelain | Select-String -Pattern '^(.. )?((ocg|408|2011_11_11)/.*\.ydk$)'
if ($hasChanges) {
    git status
    git add ocg/*.ydk, 408/*.ydk, 2011_11_11/*.ydk
    git commit -m "自动提交卡组变更"
    git push
} else {
    Write-Output "卡组未变更"
}
