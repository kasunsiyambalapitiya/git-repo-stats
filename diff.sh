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

#below lines are commented out as this is now only been used to save the diff to the relevant files
# for testing echoing the no of lines
#noChanges=$(cat ./tempFiles/diffChanges.txt | wc -l)
#echo "no of changes" $noChanges

# for testing echoing the no of lines
#noAdditions=$(cat ./tempFiles/diffAdditions.txt | wc -l)
#echo "no of additions" $noAdditions

# for testing echoing the no of lines
#noDeletions=$(cat ./tempFiles/diffDeletions.txt | wc -l)
#echo "no of deletions" $noDeletions


}

countModification $1 $2

