#!/bin/bash 

#initialising common variables
main_url="https://www.google.com/search?q="
colon_hex="%3A"
file_convection="+filetype%3A"

#Functions that process the google dorking


googleDorking_cache(){ #Full URL Required e.g. www.mchoglay.co.uk
	append="cache" 
        searchTerm=$1
        concatUrl=$main_url$append$colon_hex$searchTerm
        xdg-open $concatUrl
}



googleDorking_site(){ #Full URL Required e.g. www.mchoglay.co.uk 
	append="site" 
        searchTerm=$1
        concatUrl=$main_url$append$colon_hex$searchTerm
	#echo $concatUrl
        xdg-open $concatUrl
}

googleDorking_inurl(){
	append="inurl" 
        searchTerm=$1
        concatUrl=$main_url$append$colon_hex$searchTerm
        xdg-open $concatUrl
}

googleDorking_intitle(){
	append="intitle" 
        searchTerm=$1
        concatUrl=$main_url$append$colon_hex$searchTerm
        xdg-open $concatUrl
}

googleDorking_intext(){
	append="intext" 
        searchTerm=$1
        concatUrl=$main_url$append$colon_hex$searchTerm
        xdg-open $concatUrl
}


googleDorking_fileType_PDF(){
	searchTerm=$1
	urlWithTerm=$main_url$searchTerm  
        concatUrl=$urlWithTerm$file_convection"pdf"
	#echo $concatUrl
        xdg-open $concatUrl
}

googleDorking_fileType_PNG(){
        searchTerm=$1
        urlWithTerm=$main_url$searchTerm 
        concatUrl=$urlWithTerm$file_convection"png"
        #echo $concatUrl
        xdg-open $concatUrl
}

googleDorking_fileType_JPEG(){
        searchTerm=$1
        urlWithTerm=$main_url$searchTerm   
        concatUrl=$urlWithTerm$file_convection"jpeg"
        #echo $concatUrl
        xdg-open $concatUrl

}

googleDorking_fileType_XML(){
        searchTerm=$1
        urlWithTerm=$main_url$searchTerm   
        concatUrl=$urlWithTerm$file_convection"xml"
        #echo $concatUrl
        xdg-open $concatUrl

}

googleDorking_fileType_LOG(){
        searchTerm=$1
        urlWithTerm=$main_url$searchTerm  
        concatUrl=$urlWithTerm$file_convection"log"
        #echo $concatUrl
        xdg-open $concatUrl

}


# function calling

googleDorking_cache $1
googleDorking_site $1
googleDorking_inurl $1
googleDorking_intitle $1
googleDorking_intext $1
googleDorking_fileType_PDF $1
googleDorking_fileType_PNG $1
googleDorking_fileType_JPEG $1
googleDorking_fileType_XML $1
googleDorking_fileType_LOG $1

