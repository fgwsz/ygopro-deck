$root_path=Split-Path -Parent $MyInvocation.MyCommand.Definition
cd "$root_path"
git status
git add -A
git commit -m "delete deck"
git add ocg/*.ydk
git add 408/*.ydk
git commit -m "push deck"
git push
