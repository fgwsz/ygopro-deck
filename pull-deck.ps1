$root_path=Split-Path -Parent $MyInvocation.MyCommand.Definition
cd "$root_path"
git fetch origin
git reset --hard origin/main
