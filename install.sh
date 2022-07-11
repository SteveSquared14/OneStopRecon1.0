#!/bin/bash
ToolsDirectory=~/ReconTool

sudo apt update

mkdir Findings
#chown $ToolsDirectory `id -u -n`:`id -g -n`


#if [ ! -d $ToolsDirectory ]; then
#	echo "[!] Directory for tools ($ToolsDirectory) is not accessible or created"
#	echo "Exiting..."
#fi

#cd ..
#mv ReconTool $ToolsDirectory/ReconTool
#cd $ToolsDirectory
WorkingDrive="$(pwd)"
sudo ln -s $WorkingDrive /usr/local/bin/ReconTool

#Install exif for metadata extraction
#cd ReconTool
sudo apt install exif
chmod 755 reconToolV6.sh

echo "Installation finished!..."
echo "[!] Restart your terminal for changes to take effect"
echo
