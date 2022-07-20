# One Stop Recon Version 1.0

## Contents 

* [Project Description](#project-description)
* [Installation](#installation)
* [Usages](#usages)
* [Bugs Found](#bugs-found)
* [Future Developments](#future-developments)
* [Credits](#credits)

## Project Description

This project has been developed so that passive reconnaissance can be conducted more efficiently - through a mixture of industry standard command, and bespoke, custom-developed tools. The tool can perform the following passive reconnaissance techniques: Dorking, banner grabbing, metadata extraction, google maps requester, name server enumeration, Shodan query, extraction of txt files (Robot.txt and Security.txt) from sites and whoIS. The whole purpose of this tool is to have a more centralised system to conduct the passive reconnaissance more effectively to optimise results in the fast time available.

## Installation

```bash
git clone https://github.com/SteveSquared14/OneStopRecon.git
cd OneStopRecon 
bash install.sh
./OneStopRecon.sh
```
## Usages

Within this tool there are multiple passive reconnaissance techniques implemented into one tool. The techniques that are implemented are mentioned in the “project descriptions”. Usages of each tool are shown down below. 

```bash
Dorking: “-dB” (Bing), “-dD” (Duck Duck Go) & “-dG” (Google), Syntax = ./OneStopRecon.sh -dG yourTerm (Advisory: On the google search engine you could potentiality encounter captcha issue.To fix this issue you will need clear the cache within the browser.)
Banner Grabbing: “-g”, Syntax = ./OneStopRecon.sh -g URL (e.g., www.mchoglay.com) 
Metadata Extraction: “-M”, Syntax = ./OneStopRecon.sh -M FileName (Note: you can pass more than 1 file) 
Google Maps Requester: “-m”, Syntax = ./OneStopRecon.sh -m full address or location (e.g., 43 crescent, Salford M5 4WT) 
Name Sever Enumeration: “-n”, Syntax = ./OneStopRecon.sh -n URL (e.g., www.mchoglay.com) 
Shodan: “-s”, Syntax = ./OneStopRecon.sh -s IP address or a term (e.g., 8.8.8.8 or Hikvision) 
Text file recon: “-t”, Syntax = ./OneStopRecon.sh -t URL (e.g., www.mchoglay.com) 
Whois: “-w”, Syntax = ./OneStopRecon.sh -w URL (e.g., www.mchoglay.com) 
```

# Bugs Found
Logs:
* As of the 13th of July 2022, no bugs and problems were detected. (Remediated bugs will be logged as/if they occur in future versions).   

## Future Developments  
Version 2.0 developments will consist of: 
 * Reading input from files 
 * Save output of modules to file(s)  
 * Screenshot for Google Maps 
 * GoBuster  
 * Google Dorking enhancements  
 * Further development of Name Server Enumeration

## Credits

The following project has been desigend, developed and created by Mohammed Choglay (CTSFO-CryptoChoglay) & Steven Duckett (SteveSquared14). Current Final Year students at the University of Salford studying Computer Science w/ Cyber Security.
