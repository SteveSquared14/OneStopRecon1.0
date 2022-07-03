#!/bin/bash

metadata_Extraction(){
for file in "$@"; do 
        if [ -f $file ];
        then
                file_name=$1
                file_ext="$(echo "$file_name" | grep -Eo "[.][a-z]+")"
                echo "file extension is "$file_ext""

                echo "<------------------------------------------------------------------------------- Metadata Extraction for "$file_name" ------------------------------------------------>"
                echo "File Name & description:" "$(file $file_name)"
                echo " "
                echo "SHA512 Hash:" "$(sha512sum  $file_name)"
                echo " "
                echo "Head of Hex Dump:" "$(hexdump $file_name | head)"
                echo " "

                if [ $file_ext == ".png" ] || [ $file_ext == ".jpg" ] || [ $file_ext == ".jpeg" ];
                        # || [ $file_ext == ".gif" ] || [ $file_ext == ".tiff" ] || [ $file_ext == ".psd" >
                then
                        exif $file_name
                        #echo "Test, extension ok"
                        echo " "
                        shift
                else
                        echo "File not compatible for EXIF data extraction"
                        echo " "
                        shift
                fi
        else
                echo "Warning: Only files are compatible with this module!"
        fi
done;
}


#function calling
metadata_Extraction $@
