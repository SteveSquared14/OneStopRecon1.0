#!/bin/bash 

#Functions that process the google dorking 

googleDorking_site(){   
	urlPrepended="https://www.google.com/search?q=site%3A" 
        searchTerm=$1
        concatUrl=$urlPrepended$searchTerm
	#echo $concatUrl
        xdg-open $concatUrl
}

googleDorking_inurl(){
urlPrepended="https://www.google.com/search?q=inurl%3A" 
        searchTerm=$1
        concatUrl=$urlPrepended$searchTerm
        xdg-open $concatUrl
}

googleDorking_intitle(){
urlPrepended="https://www.google.com/search?q=intitle%3A" 
        searchTerm=$1
        concatUrl=$urlPrepended$searchTerm
        xdg-open $concatUrl
}

googleDorking_intext(){
urlPrepended="https://www.google.com/search?q=intext%3A" 
        searchTerm=$1
        concatUrl=$urlPrepended$searchTerm
        xdg-open $concatUrl
}

googleDorking_fileType_PDF(){
urlPrepended="https://www.google.com/search?q="
	searchTerm=$1
	urlWithTerm=$urlPrepended$searchTerm  
        concatUrl=$urlWithTerm"+filetype%3Apdf"
	#echo $concatUrl
        xdg-open $concatUrl
}

# fucntion calling for testing

#googleDorking_site $1
#googleDorking_inurl $1
#googleDorking_intitle $1
#googleDorking_intext $1
googleDorking_fileType_PDF $1
