#!/bin/bash
# two commits are passed as arguments



countModification(){
#setting git repo location
gitRepoLocation=$1

mkdir -p tempFiles

#pipe all diff to a file
git -C "$gitRepoLocation" difftool -y -x "diff -c" $2 $3 >>./tempFiles/diffAll.txt


#Filtering only the lines that are modified
git -C "$gitRepoLocation" difftool -y -x "diff -c" $2 $3 | awk '{print $1;}'|sed -n -e "/^\*\*\*/,/^---/{p;}" | awk '{if ($1=="!") print $1;}' >> ./tempFiles/diffChanges.txt

#count the no of additions
git -C "$gitRepoLocation" difftool -y -x "diff -c" $2 $3 | awk '{if ($1=="+")print $1;}' >> ./tempFiles/diffAdditions.txt

#count the no of deletions
git -C "$gitRepoLocation"  difftool -y -x "diff -c" $2 $3 | awk '{if ($1=="-")print $1;}' >> ./tempFiles/diffDeletions.txt




}

countModification $1 $2 $3

