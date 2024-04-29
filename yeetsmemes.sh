#!/bin/sh
#
# **COMING SOON, STILL A W.I.P!
#
# This script copyright (c)  2024 Jacob "yeetsup" Hache
# See <LICENSE> stored in root folder, or at:
# <http://fsf.org/licenses/gpl-2.0>
#
# Want to learn bash scripting? Too bad, kid, look it
# up at: 
# <http://google.com/search?q=How+to+bash+script?>
# 
# ==================
# About this script
# ==================
#
# What does it do?
# 
# It takes my memes, and downloads them to whatever 
# folder you choose. 
# [CONCEPT] You can pick which ones you want and 
# open them in your web browser or program of choice,
# be that an image editor or viewer, idc its ur choice,
# you can type in any program if its installed (and if
# it can open basic images, like .png's or .jpeg's, 
# although it'd be nice if it could open .webp's, too)
# and it will open it in that program.
#
# also, OW OWIES OUCH MY DICK SOMEONE CUT IT OFF
# 
# --------------------------
# colors and formatting vars
# --------------------------

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
OnBlack='\033[40m'       # Black
OnRed='\033[41m'         # Red
OnGreen='\033[42m'       # Green
OnYellow='\033[43m'      # Yellow
OnBlue='\033[44m'        # Blue
OnPurple='\033[45m'      # Purple
OnCyan='\033[46m'        # Cyan
OnWhite='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'	  # red

# Reset/normal text
TxtReset='\033[0m'

# #################################
clear
echo "Welcome to ${BBlue}Yeet's Memes Downloader${TxtReset}${BGreen} v11111111111.0${TxtReset}${BRed}-ALPHA${TxtReset}! Make sure you're connected to the internet and that cURL is installed."
echo "Please note that this is a ${BWhite}${UWhite}VERY${TxtReset}${UWhite} early build and literally ${UWhite}does nothing.${TxtReset}"
echo "This downloader script comes from ${BWhite}Yeet's Scripts${TxtReset}: ${UBlue}https://github.com/yeetssite/scripts${TxtReset}"
echo "${BWhite}----------${TxtReset}"
echo "To check your internet connection, use ping: ${BPurple}ping google.com${TxtReset} (you can stop it by hitting ${BCyan}CTRL C${TxtReset}.)"
echo "${BWhite}----------${TxtReset}"
echo "To install cURL, use your system's package installer."
echo "For example, on ubuntu or debian, you'd run apt: ${BPurple}sudo apt install curl${TxtReset}"
echo "${BWhite}----------${TxtReset}"
echo "${BBlack}${OnWhite}=========Downloading memes=========${TxtReset}"
echo "You have 4 options:"
echo " "
echo "${Black}${OnWhite}[1]${TxtReset} Download and archive (.zip) memes"
echo "${Black}${OnWhite}[2]${TxtReset} Download and place memes in current directory"
echo "${Black}${OnWhite}[3]${TxtReset} Download and place memes in a new ${Black}${OnBlue}./yeets-memes${TxtReset} directory"
echo "${Black}${OnWhite}[4]${TxtReset} Cancel Download"
echo " "
echo "To select something, type the number beside the option you wanna choose and press ${BCyan}ENTER${TxtReset}"
read -p "Pick one: " downlopt
echo " "

# Make Things do stuff

if [ $downlopt = 1 ]
then
	echo "${BGreen}Downloading Memes to Current Folder...${TxtReset}"
	sleep 1s
	echo "Getting memes from ${UBlue}https://yeetssite.github.io/memes/IMG/${TxtReset}"
	sleep 0.5s
	echo "Checking Response code(s)..."	
	response_code=$(curl -s -o /dev/null -w "%{http_code}" "https://yeetssite.github.io/memes/")
	if [ ${response_code} = 200 ]
	then
		frcode1=$(curl -s -o /dev/null -w "%{http_code}" "https://yeetssite.github.io/memes/IMG/IMG_001.png")
		frcode2=$(curl -s -o /dev/null -w "%{http_code}" "https://yeetssite.github.io/memes/IMG/IMG_002.png")

		dsuccess="${frcode1},${frcode2}"

		echo "${Blue}Success! Response code: ${TxtReset}${Green}${response_code}${TxtReset}"	        
		if [ ${frcode1} = 200 ]; then
		echo "Downloading ${Black}${OnBlue}IMG_001.png${TxtReset}..."
		curl -s -O "https://yeetssite.github.io/IMG/IMG_001.png"
		echo "${Green}Done! Response code ${frcode1}.${TxtReset}"
		else
		echo "${Red}Could not download ${Black}${OnBlue}IMG_001.png${TxtReset}${Red}: Status code ${frcode1}${TxtReset}"
		fi
		if [ $frcode2 = 200 ]; then
		echo "Downloading ${Black}${OnBlue}IMG_002.png${TxtReset}..."
		curl -s -O "https://yeetssite.github.io/memes/IMG/IMG_002.png"
		echo "${Green}Done! Response code ${frcode2}.${TxtReset}"
	        else
		echo "${Red}Could not download ${Black}${OnBlue}IMG_002.png${TxtReset}${Red}: Status code ${frcode1}${TxtReset}"
		fi
		if [ ${dsuccess}  = "200,200" ]; then
		echo "${BGreen}Download finished!${TxtReset}"
		echo "Use ${BPurple}ls${TxtReset} to list your folder contents and look for files like ${Black}${OnBlue}IMG_001.png${TxtReset}, ${Black}${OnBlue}GIF_001.gif${TxtReset}, or ${Black}${OnBlue}VIDEO_001.mp4${TxtReset}."
		else
		echo "${BGreen}Download finished,${TxtReset}${BYellow} but some files weren't downloaded.${TxtReset}"
		echo "Use ${BPurple}ls${TxtReset} to list your folder contents and look for files like ${Black}${OnBlue}IMG_001.png${TxtReset}, ${Black}${OnBlue}GIF_001.gif${TxtReset}, or ${Black}${OnBlue}VIDEO_001.mp4${TxtReset}."
		fi
	
	else
		echo "${BRed}Uh Oh! Expected a response code of ${TxtReset}${BGreen}200,${TxtReset}${BRed} got one of${BYellow} ${response_code}${TxtReset}${Bed} instead.${TxtReset}"
	fi
fi

if [ $downlopt = 2 ]
then
	echo "${Yellow}You picked 2, but my smol brain can only code so much at a time. Nothing will be downloaded.${TxtReset}"
fi

if [ $downlopt = 3 ]
then
	echo "${Yellow}You picked the third thing, but i havent coded anything for the third thing yet (lol). Nothing downloaded.${TxtReset}"
fi

if [ $downlopt = 4 ]
then
	echo "${BRed}Cancelled.${TxtReset}"
	# Shows some text saying "Cancelled" and finishes this script
fi

