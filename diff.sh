#!/bin/bash
# two commits are passed as arguments



countModification(){
mkdir -p tempFiles
#count the no of modifications
git difftool -y -x "diff -c" $1 $2 | awk '{if ($1=="!")print $1;}' >> ./tempFiles/diffChanges.txt

#count the no of additions
git difftool -y -x "diff -c" $1 $2 | awk '{if ($1=="+")print $1;}' >> ./tempFiles/diffAdditions.txt

#count the no of deletions
git difftool -y -x "diff -c" $1 $2 | awk '{if ($1=="-")print $1;}' >>./tempFiles/diffDeletions.txt




}

countModification $1 $2

