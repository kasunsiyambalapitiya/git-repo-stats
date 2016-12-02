#!/bin/bash
#the initial commit ID is given

#saving the no of commits in between the two commits
saveListOfCommits(){
mkdir -p tempFiles

git log --pretty=format:%H $1 $2 >./tempFiles/ListOfCommits.txt
echo "list of commits are stored in a file from commit $1 to commit $2 successfully"

}

saveListOfCommits $1 $2
