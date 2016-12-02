#!/bin/bash

#Reading the file content line by line
#saving the file name to a variable

filename=$1

#we need to run this twice to get the 2 commit hashes

#commitHash1
#commitHash2

#getOneCommitHash{
#while read -r commitHash
#do 
#commitHash1=$commitHash
#echo $commitHash1
#done <$filename

#creating an array by reading the file

				readarray commitArray < $filename

								echo ${commitArray[@]}
#finding the number of lines in the array
				commitArrayLength=${#commitArray[@]}
				echo $commitArrayLength
				echo  ${!commitArray[@]}

#looping throught the array and running the diff
#for i in ${!commitArray[@]}    
#do
#./diff.sh ${commitArray[$i]} ${commitArray}

#done

for ((i=0;i<commitArrayLength;i++));
do 
#echo ${commitArray[i]}
#echo ${commitArray[++i]}
./diff.sh ${commitArray[i]} ${commitArray[++i]}
((--i))

done

