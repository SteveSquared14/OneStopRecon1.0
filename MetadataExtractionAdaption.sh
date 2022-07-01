#!/bin/bash

file_name=$1
file_ext="$(echo "$file_name" | grep -Eo "[.][a-z]+")"
echo $file_ext

metadata_Extraction(){
echo  "-------------------------------------------------------------------------------Metadata Extracted ------------------------------------------------------------------------------"
echo "File name & description:" "$(file $file_name)"
echo "SHA512 hash:" "$(sha512sum  $file_name)"
echo "Hex dump:" "$(hexdump $file_name | head)"


for file in "$file_name"; do 
        if [ -f $file_name ];
        then 
                if [ $file_ext == ".png" ] || [ $file_ext == ".jpg" ] || [ $file_ext == ".jpg" ] || [ $file_ext == ".gif" ] || [ $file_ext == ".tiff" ] || [ $file_ext == ".psd" ] || [ $file_ext == ".ai" ] || [ $file_ext == ".indd" ] || [ $file_ext == ".raw" ];
                then
			exif $file_name 
		else
		echo "file not compatible for EXIF data extraction"
                fi
        fi 
done;

}


# function calling
metadata_Extraction

