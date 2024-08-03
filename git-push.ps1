echo "You Can Input q For Abort."
$commit_info=Read-Host -Prompt "Input Git Commit Info"
if(!($commit_info -eq "q")){
    git add 408/*.ydk
    git add ocg/*.ydk
    git add README.md
    git add .gitignore
    git add *.sh
    git add *.ps1
    git commit -m "$commit_info"
    git push
}
