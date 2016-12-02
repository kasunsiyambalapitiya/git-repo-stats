#!/bin/bash
#argument  variable
$1

save(){
mkdir -p tempFiles
cloc "$1" > ./tempFiles/cloc.txt

#selecting only sum

egrep "SUM" ./tempFiles/cloc.txt >./tempFiles/afterEgrep.txt
# trim the spaces and saving it
noOfLines=$( cat ./tempFiles/afterEgrep.txt | tr -s " " | cut -d " " -f5 )

echo $noOfLines
}

save $1
