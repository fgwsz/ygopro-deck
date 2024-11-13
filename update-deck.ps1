$root_path=Split-Path -Parent $MyInvocation.MyCommand.Definition
cd "$root_path"
git status
git add -A
git add ocg/*.ydk
git add 408/*.ydk
git add 2011_11_11/*.ydk
git commit -m "Update deck."
git push --force
