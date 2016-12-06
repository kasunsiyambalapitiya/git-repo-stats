#!/bin/bash
# two commits are passed as arguments



countModification(){
mkdir -p tempFiles
#count the no of modifications
#git difftool -y -x "diff -c" $1 $2 | awk '{if ($1=="!")print $1;}' >> ./tempFiles/diffChanges.txt
#git difftool -y -x "diff -c" $1 $2 | awk '{print $1;}' > ./tempFiles/diffChanges.txt

#filtering only the lines modified
#cat ./tempFiles/diffChanges.txt | sed -n -e "/^\*\*\*/,/^---/{p;}" | awk '{if($1=="!") print $1;}' > ./tempFiles/diffChangesAfterSed.txt

#Filtering only the lines that are modified
git difftool -y -x "diff -c" $1 $2 | awk '{print $1;}'|sed -n -e "/^\*\*\*/,/^---/{p;}" | awk '{if ($1=="!") print $1;}' >> ./tempFiles/diffChanges.txt

#count the no of additions
git difftool -y -x "diff -c" $1 $2 | awk '{if ($1=="+")print $1;}' >> ./tempFiles/diffAdditions.txt

#count the no of deletions
git difftool -y -x "diff -c" $1 $2 | awk '{if ($1=="-")print $1;}' >> ./tempFiles/diffDeletions.txt




}

countModification $1 $2

