#!/bin/bash
#the initial commit ID is given

#saving the no of commits in between the two commits
saveListOfCommits(){
rm -rf tempFiles;	mkdir tempFiles
								location=./tempFiles/ListOfCommits.txt
								outputDirectory=./tempFiles/
#combining the word

								date="$1 $2 $3"


#getting only the comments from master branch from given period of time
								git log --pretty=format:%H --since="$date" master >"$location"
								echo "list of commits are stored in a file from $date onwards"

}

saveListOfCommits $1 $2 $3 $4


#running the readingTheListCommitsAndExcuteDiffforAll.sh
./readingTheListOfCommitsAndExcuteDiffForAll.sh $location

#running the output.sh file
./output.sh $outputDirectory
