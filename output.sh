#!/bin/bash
#counting the changes in the code

location=$1
echo location of the saved outputs from diff.sh $location
#for echoing the no of lines changed
noChanges=$(cat "$location"/diffChanges.txt | wc -l)
echo "no of changes" $noChanges

#for echoing the no of lines added
noAdditions=$(cat "$location"/diffAdditions.txt | wc -l)
echo "no of additions" $noAdditions

#for echoing the no of lines deleted
noDeletions=$(cat "$location"/diffDeletions.txt | wc -l)
echo "no of deletions" $noDeletions

