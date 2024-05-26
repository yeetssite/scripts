#!/bin/bash

ver="v1.1.1.0"
devstage="alpha"

internetcheckvars(){
	internetstatus=$(curl -so /dev/null -w "%{http_code}" https://github.com)
	if [ $internetstatus = 200 ]; then
		sleep 0.5s;
		online="true"
	else
		online="httperr"
		sleep 1s
		httpstatus000="false"
		httpstatus404="false"
		if [ $internetstatus = 000 ]; then
			httpstatus000="true"
			online="false"
		fi
		if [ $internetstatus = 404 ]; then
			httpstatus404="true"
			online="true"
		fi
	fi
	
} 

internetcheck(){
echo -e "Checking internet connection..."; sleep .5s
internetcheckvars
if [ $online = "true" ]; then
	echo "Connected to https://github.com, which means you're connected to the interwebs!"
fi	

if [ $online = "httperr" ]; then
	if [ $httpstatus404 = "true" ]; then
		echo -e ""
	fi
fi
}

scrphelp(){
echo "Gitted - Git Tools | Help"
echo "Availible flags:"
echo "	-h	Displays this help and exits"
echo "	-v	Displays basic version info"
echo "	-V	Displays all info"
echo "	-c	Adds and commits changes in the current directory (if possible)"
echo "	-p	Adds, commits, then pushes changes in the current directory"
if [ ! -f /usr/bin/git ]; then
echo -e "\n\x1b[33m[WARNING]: Git is not installed. Gitted needs Git to work, so please follow the installation instructions at \x1b[0;34;4mhttps://git-scm.com/book/en/v2/Getting-Started-Installing-Git\x1b[0m"
exit 2
fi
}

commit(){
if [ -f /usr/bin/git ]
then
	if [ -r $PWD/.git/ ]; then
		git add .
		read -p "Enter a commit message: " commitmsg
		git commit -m "${commitmsg}"
	else
		echo -e "\x1b[1;31m[3]: Either this directory isn't a repository, or Gitted just can't find \"${PWD}/.git/\".\x1b[m"
		exit 3
	fi
else
	echo -e "\x1b[1;31m[2]: Git is not installed. Gitted needs Git to work, so please follow the installation instructions at \x1b[0;34;4mhttps://git-scm.com/book/en/v2/Getting-Started-Installing-Git\x1b[m"
	exit 2
fi
}

flag=$1 
case $flag in
	-p)
		commit
		read -p "Would you like to push commits to a remote repository?(if possible)? y/n: " pushanswr
		case $pushanswr in	
			y)
				git push
				echo "pushed successfully!"
			;;
			n)
				echo "Ok, not pushing."
			;;
			*)
				echo "Not a valid answer, so not pushing."
				exit 1
			;;
		esac
	;;
	-c)
		commit
	;;
	-v)
		echo "Gitted - Git Tools | Version ${ver}-${devstage}"
		echo "Copyright (C) 2024 Jacob \"yeetsup\" Hache."
		echo "See https://yeetssite.github.io/yssl-1.0/ for licensing info."
		echo -e "\nType \"gitted -V\" for more technical/advanced info."
	;;

	-V)
		echo -e "\x1b[47;30mGitted - Git tools | All info\x1b[0m\n"
		echo -e "\x1b[1mVersion:\x1b[m"
		echo "	Full version number: ${ver}"
		echo "	Version codename: McDicken 10pc"
		echo "	    - Codename alias: McDicken"
		echo -e "	Development stage: ${devstage}\n"
		echo -e "\x1b[1mGit:\x1b[m"
		if [ -f /usr/bin/git ]; then
		gitinstalled="Yes"
		gitusername=$(git config --global user.name)
		gitemail=$(git config --global user.email)
		if [ -f /usr/bin/gh ]; then
		ghcliInstalled="Yes"
		else
		ghcliInstalled="No"
		fi
		if [ -f /usr/bin/glab ]; then
		glabinstalled="Yes"
		else
		glabinstalled="No"
		fi
		else
		gitinstalled="No"
		gitusername="No Git?"
		gitemail="Get Git"
		ghcliInstalled="Or Git Get"
		glabinstalled="They both sound the same anyways"
		fi
		echo "	Installed: ${gitinstalled}"
		echo "	Username: ${gitusername}"
		echo "	Email: ${gitemail}"
		echo "	GitHub CLI installed: ${ghcliInstalled}"
		echo -e "	GitLab CLI installed: ${glabinstalled}\n"
		echo -e "\x1b[1mAuthor and Copyright:\x1b[m"
		echo "	This script is a part of yeet's scripts, which are written by Jacob \"Yeetsup\" Hache."
		echo "	Yeet's scripts is licensed under a custom license, availible at https://yeetssite.github.io/yssl-1.0/"
		echo "	This code and Yeet's scripts Copyright (c) 2024 Jacob \"Yeetsup\" Hache. Fair use applies here." 
		;;
		-h)
		scrphelp
		exit
		;;
		*)
		scrphelp
		 echo -e "\x1b[1;31m[1]: \"$1\" is not an option!"
		 exit 1
		 ;;
		
esac

	echo "$OPTARG"
