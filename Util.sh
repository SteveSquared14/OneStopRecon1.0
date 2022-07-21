#!/bin/bash

PATH="$(pwd)"
. $PATH/functionLibrary2.0.sh 

#Reading Files

function whoisReadingFile(){
fileName=$1
echo "[!] Data extracted from $1"
while read line;
do
   whoIsFunc $line
done < ${fileName}
}

function dnsReadingFile(){
fileName=$1
echo "[!] Data extracted from $1"
while read line;
do 
    dnsCheck $line
done < ${fileName}
}

function txtFileReadingFile(){
fileName=$1
echo "[!]" Data extracted from $1
while read line 
do 
    txtFileChecks $line
done < ${fileName}
}


#File Outputting 

function whoisOutputtingFile(){
echo ""
}

function dnsOutputting(){
echo ""
}

function metadataOutputting(){
echo ""
}

function bannerGrabbingOutputting(){
echo ""
}

function txtFileOutputtingFile(){
echo ""
}

#Error Handling 

#function Testing

whoisReadingFile $1
#dnsReadingFile $1
#txtFileReadingFile $1
