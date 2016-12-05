#!/bin/bash

#Reading the file content line by line
#saving the file name to a variable

filename=$1


#creating an array by reading the file

readarray commitArray < $filename

echo ${commitArray[@]}
#finding the number of lines in the array
commitArrayLength=${#commitArray[@]}
echo no of elements in the array  $commitArrayLength
echo indexes of the array ${!commitArray[@]}

#for loop for runnig the diff between consecutive commits in the array
for ((i=0;i<commitArrayLength;i++));
do 
#echo ${commitArray[i]}
#echo ${commitArray[++i]}
./diff.sh ${commitArray[i]} ${commitArray[++i]}
((--i))

				done

				echo diff are saved in the tempFiles directory

