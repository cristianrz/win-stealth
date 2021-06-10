#!/bin/bash

CURRENT=$(hostname)
HOSTNAME_PREFIX="ANS-LT-"

randomise_hostname(){

	new="$HOSTNAME_PREFIX"-$(echo -e $RANDOM | cut -c -2)

	if ! wmic computersystem where caption=\'"$CURRENT"\' rename \'"$new"\'; then
		echo -e [X] wmic failed
		echo -e [X] Exiting....
		return 1
	fi

	return 0
}

echo -e "\e[34m[*]\e[39m Randomising hostname"

if ! randomise_hostname >/dev/null 2>&1; then
	echo -e "\e[34m[X] wimc failed"
	echo -e "\e[34m[X] exiting"
	exit 1
fi

echo -e "\e[34m[*]\e[39m Successfully swapped \"$CURRENT\" for \"$new\""
echo -e "\e[34m[*]\e[39m Launching MAC randomiser..."

"C:\Users\Cristian\Vault\Apps\random-mac-address\RandomMac.exe"

echo -e "\e[34m[*]\e[39m New MAC applied"

echo -e "\e[34m[*]\e[39m Restart your computer for changes to take effect"

echo; echo -e "Press ENTER to exit"

read -r
