#!/bin/bash
#counting the changes in the code

location=$1
echo location of the saved outputs from diff.sh $location
#for echoing the no of lines changed=======================================
noChanges=$(cat "$location"/diffChanges.txt | wc -l)
echo "no of changes" $noChanges

#for echoing the no of lines added========================================

#no of lines added via modification of lines
linesAddedInModification=$(cat "$location"/diffAfterChanges.txt | wc -l)
actualLinesAddedInModification=$(($linesAddedInModification-$noChanges))

echo Actualno added via modification $actualLinesAddedInModification

#no of lines directly added to the repo
directNoAdditions=$(cat "$location"/diffAdditions.txt | wc -l)

#adding the actual no of lines added in modification to the no of lines directly added

noAdditions=$(($directNoAdditions+$actualLinesAddedInModification))
echo "no of additions" $noAdditions

#for echoing the no of lines deleted
noDeletions=$(cat "$location"/diffDeletions.txt | wc -l)
echo "no of deletions" $noDeletions

