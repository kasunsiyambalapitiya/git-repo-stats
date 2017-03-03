#!/bin/bash
#At first the git repo must be cloned to a local directory. Then the location of that directory followed by the time constraints ( Ex: 3 months ago ) must be given as command line arguments to the shell script

#global variable initialization
locationOfCommitsList=./tempFiles/ListOfCommits.txt
outputDirectory=./tempFiles/
repoLocation=$1
#combining the words for the time constrain in git log
date="$2 $3 $4"


#=========saving the list of commit hashes in the given time constrain =======================================================================================
saveListOfCommits(){

#creating the directory for saving the temp files generated in the calculation
				rm -rf tempFiles;	mkdir tempFiles

#getting only the commit hash values from master branch for the  given constrain of time and saving in a directory as a txt file
								git -C "$repoLocation" log --pretty=format:%H --since="$date" --no-merges master --reverse >"$locationOfCommitsList"
								echo "list of commit hashes are stored in a txt file from $date onwards"

}


#=========running the readingTheListCommitsAndExcuteDiffforAll.sh with passing the locatio of the commit hash file and the repo location================================

readingTheListOfCommitsAndExcuteDiffForAll(){

#creating an array by reading the file

				readarray commitArray < $locationOfCommitsList

#								echo ${commitArray[@]}
#finding the number of lines in the array
				commitArrayLength=${#commitArray[@]}
				echo no of elements in the array  $commitArrayLength
#								echo indexes of the array ${!commitArray[@]}

#for loop for running the diff between consecutive commits in the array
				for ((i=0;i<commitArrayLength;i++));
				do

								gettingTheDiffBetweenEachCommitsAndAppendTheResultToAFile ${commitArray[i]} ${commitArray[++i]}
				((--i))

								done

								echo diffs are saved in the tempFiles directory


output ${commitArray[0]}

}

#========Getting the diff between consecutive commits saved in the listOfCommits.txt and printing them to seperate files ==========================================

gettingTheDiffBetweenEachCommitsAndAppendTheResultToAFile(){

#creating the directory tempFiles if it doesnot exists
				mkdir -p tempFiles

#pipe all diff to a file
								git -C "$repoLocation" difftool -y -x "diff -c" $1 $2 >>./tempFiles/diffAll.txt

#Filtering only the lines that are modified
								git -C "$repoLocation" difftool -y -x "diff -c" $1 $2 | awk '{print $1;}'|sed -n -e "/^\*\*\*/,/^---/{p;}" | awk '{if ($1=="!") print $1;}' >> ./tempFiles/diffChanges.txt

#count the no of additions
								git -C "$repoLocation" difftool -y -x "diff -c" $1 $2 | awk '{if ($1=="+")print $1;}' >> ./tempFiles/diffAdditions.txt

#count the no of deletions
								git -C "$repoLocation" difftool -y -x "diff -c" $1 $2 | awk '{if ($1=="-")print $1;}' >> ./tempFiles/diffDeletions.txt

}

#========running the output method==============================================

output(){

echo location of the saved outputs from diff.sh $outputDirectory
 
#for echoing the no of lines changed-------------------------------------
noChanges=$(cat "$outputDirectory"/diffChanges.txt | wc -l)
echo "no of lines changed" $noChanges

#for echoing the no of lines added--------------------------------------

#no of lines directly added to the repo
noAdditions=$(cat "$outputDirectory"/diffAdditions.txt | wc -l)
echo "no of lines added" $noAdditions
 
#for echoing the no of lines deleted------------------------------------
noDeletions=$(cat "$outputDirectory"/diffDeletions.txt | wc -l)
echo "no of lines deleted" $noDeletions

#Counting the total no of lines in the repo-----------------------------------------------------------------
#Checking out to the earliest commit with creating a new branch
git -C "$repoLocation" checkout -b branchAtEarliestPoint $1

totalNoOfLinesInTheRepo=$(git -C "$repoLocation" diff --shortstat $(git -C "$repoLocation" hash-object -t tree /dev/null) | cut -d " " -f5)
echo total no of lines in the repo $totalNoOfLinesInTheRepo


#calcutlating percentages of line changes----------------------------------------------------------------------------
changesPercentage=$(awk "BEGIN { cp=100*${noChanges}/${totalNoOfLinesInTheRepo}; i=int(cp); print (cp-i<0.5)? i:i+1 }") 
additionPercentage=$( awk "BEGIN {ap=100*${noAdditions}/${totalNoOfLinesInTheRepo};j=int(ap);print (ap-j<0.5)? j:j+1 }")
deletionPercentage=$( awk "BEGIN {dp=100*${noDeletions}/${totalNoOfLinesInTheRepo};k=int(dp);print (dp-k<0.5)? k:k+1}")


echo "percentage of lines changes-----------------------"
echo percentage of changed lines $changesPercentage %
echo percentage of added lines $additionPercentage %
echo percentage of deleted lines $deletionPercentage %

#checking out to the master branch and deleting the temporary branch named branchAtEarliestPoint
git -C "$repoLocation" checkout master
git -C "$repoLocation" branch -d branchAtEarliestPoint

}


#calling method
saveListOfCommits
readingTheListOfCommitsAndExcuteDiffForAll
