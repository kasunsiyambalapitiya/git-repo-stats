#!/bin/bash
#first the git repo must be cloned to a local directory and then the location of the local git repo and the time constraints ( Ex: 2 weeks ago ) must be given as command line arguments to the shell script

#saving the list of commit hashes in the given time constrain
saveListOfCommits(){

#creating the directory for saving the temp files generated in the calculation
rm -rf tempFiles;	mkdir tempFiles
								location=./tempFiles/ListOfCommits.txt
								outputDirectory=./tempFiles/

#combining the words for the time constrain in git log

								date="$2 $3 $4"


#getting only the commit hash values from master branch for the  given constrain of time and saving in a directory as a txt file
								git -C "$1" log --pretty=format:%H --since="$date" --no-merges master --reverse >"$location"
								echo "list of commit hashes are stored in a txt file from $date onwards"

}

saveListOfCommits $1 $2 $3 $4 $5


#running the readingTheListCommitsAndExcuteDiffforAll.sh with passing the location of the commit hash file and the repo location
./readingTheListOfCommitsAndExcuteDiffForAll.sh $location $1

#running the output.sh with passing the directory to save the outputs
./output.sh $outputDirectory
