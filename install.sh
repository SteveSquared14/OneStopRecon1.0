#!/bin/bash

ToolsDirectory=~/tools

sudo apt update

mkdir -p $ToolsDirectory
chown $ToolsDirectory `id -u -n`:`id -g -n`


if [ ! -d $ToolsDirectory ]; then
	echo "[!] Directory for tools ($ToolsDirectory) is not accessible or created"
	echo "Exiting..."
fi

cd ..
mv ReconTool $ToolsDirectory/ReconTool
cd $ToolsDirectory
sudo ln -s `pwd`/ReconTool/ReconTool /usr/local/bin/ReconTool

#Install exif for metadata extraction
cd ReconTool
sudo apt install exif

echo "Installation finished!..."
echo "[!] Restart your terminal for changes to take effect"
echo
