#!/usr/local/bin/bash

# Erlend Sekkelsten 2019
# erlend.sekkelsten@gmail.com
# https://github.com/esekkelsten

# Tests if the client has wget installed. Exits if wget isn't found.

command -v wget >/dev/null 2>&1 || ( echo "Missing wget. Install wget to use this script."; exit 1; )

# Listing the different Elfquest series

eq="Elfquest" # 21 issues
sabm="Siege at Blue Mountain" # 8 issues
kobw="Kings of the Broken Wheel" # 9 issues
wr="Wolfrider" # graphic novel
dt="Dreamtime" #graphic novel
hy="Hidden Years" # 29 issues
hyc="Hidden Years Colors" # issues 25-29
sh="Shards" # 16 issues
shc="Shards Colors" # issues 12-16
sas="Searcher and The Sword" # graphic novel
disc="The Discovery" # graphic novel
tc="Blood of Ten Chiefs" # 20 issues
iabb="In All But Blood" # graphic novel
nb="New Blood" # 35 issues
nbss2="New Blood Summer Special 2" # Single issue
wd="Wavedancers" # issue 1, graphic novel, lost chapters
wh="Wild Hunt" # graphic novel
ka="Khavi" # Graphic novel in color
ts="Two-Spear" # 5 issues
rc="Rogue's Curse" # graphic novel
jk="Jink" # 12 issues
rb="The Rebels" # 12 issues
fq="Future Quest" # graphic novel
fe="Fire Eye" # graphic novel

# Functions

function startVarsel { # Arguments= $1: title $2: number
	printf "\n====================\n"
	printf "Laster ned %s nummer %s.\n" "$1" "$2"
	date
	printf "====================\n\n"
}
function sluttVarsel {
	printf "\n====================\n"
	printf "Ferdig med %s nummer %s.\n" "$1" "$2"
	date
	printf "\n====================\n"
}
function startVarselSingle { # Arguments= $1: title
	printf "\n====================\n"
	printf "Laster ned %s.\n" "$1"
	date
	printf "====================\n\n"
}
function sluttVarselSingle {
	printf "\n====================\n"
	printf "Ferdig med %s.\n" "$1"
	date
	printf "\n====================\n"
}
# Download example: download 'http://elfquest.com/read/OQ/OQ$i/oq$i-$p.jpg'
function download { # Arguments: 1: URL with $p for page number
	if [[ -z $1 ]]
		then
			echo "Argument missing."
			exit 1
	fi
	for p in {0..1000}
	do
		wget -nv $(eval "echo "$1"")
		exit_status=$?
		if [ $exit_status -eq 8 ]; then
			break
		elif [ $exit_status -ne 0 ]; then
			echo "Møtte ukjent feil: $exit_status" >&2
			exit 1
		fi
	done
}

# === This is where the magic happens ===

# Elfquest
	if [[ -d "$eq" ]]; then
		echo "$eq finnes allerede."
	else
		echo "Starter nedlasting av $eq"
		mkdir "$eq"
		cd "$eq"
		for i in {01..21} # Issues to download
		do
			pwd
			startVarsel $eq $i
			download 'http://elfquest.com/read/OQ/OQ$i/oq$i-$p.jpg'
			sluttVarsel
		done
		cd ../
		pwd
	fi

# SABM
	if [[ -d "$eq - $sabm" ]]; then
		echo "$eq - $sabm finnes allerede."
	else
		echo "Starter nedlasting av $sabm"
		mkdir "$eq - $sabm"
		cd "$eq - $sabm"
		for i in {01..08}
		do
			pwd
			startVarsel $sabm $i
			download 'http://elfquest.com/read/SABM/SABM$i/sabm$i-$p.jpg'
			sluttVarsel $sabm $i
		done
		cd ../
		pwd
	fi

# KOBW
	if [[ -d "$eq - $kobw" ]]; then
		echo "$eq - $kobw finnes allerede."
	else
		echo "Starter nedlasting av $kobw"
		mkdir "$eq - $kobw"
		cd "$eq - $kobw"
		for i in {01..08}
		do
			pwd
			startVarsel $kobw $i
			download 'http://elfquest.com/read/KOBW/KOBW0$i/kobw0$i-$p.jpg'
			sluttVarsel $kobw $i
		done
		cd ../
		pwd
	fi

# Wolfrider
	if [[ -d "$eq - $wr" ]]; then
		echo "$eq - $wr finnes allerede."
	else
		echo "Starter nedlasting av $wr"
		mkdir "$eq - $wr"
		cd "$eq - $wr"
		pwd
		startVarselSingle $wr
		download 'http://elfquest.com/read/WR/awr-$p.jpg'
		sluttVarselSingle $wr
		cd ../
		pwd
	fi

# Dreamtime
	if [[ -d "$eq - $dt" ]]; then
		echo "$eq - $dt finnes allerede."
	else
		echo "Starter nedlasting av $dt"
		mkdir "$eq - $dt"
		cd "$eq - $dt"
		pwd
		startVarselSingle $dt
		download 'http://elfquest.com/read/DTC/dtc-$p.jpg'
		sluttVarselSingle $dt
		cd ../
		pwd
	fi

# Hidden Years
	if [[ -d "$eq - $hy" ]]; then
		echo "$eq - $hy finnes allerede."
	else
		echo "Starter nedlasting av $hy"
		mkdir "$eq - $hy"
		cd "$eq - $hy"
		for i in {01..24}
		do
			pwd
			startVarsel $hy $i
			download 'http://elfquest.com/read/HY/HY$i/hy$i-$p.jpg'
			sluttVarsel $hy $i
		done
		echo "Starter nedlasting av $hyc"
		# Hidden Years Colors
		pwd
		startVarselSingle $hyc
		download 'http://elfquest.com/read/HYC/hyc-$p.jpg'
		sluttVarselSingle $hyc
		cd ../
		pwd
	fi

# Shards
	if [[ -d "$eq - $sh" ]]; then
		echo "$eq - $sh finnes allerede."
	else
		echo "Starter nedlasting av $sh"
		mkdir "$eq - $sh"
		cd "$eq - $sh"
		for i in {01..11}
		do
			pwd
			startVarsel $sh $i
			download 'http://elfquest.com/read/SH/SH$i/sh$i-$p.jpg'
			sluttVarsel $sh $i
		done
		echo "Starter nedlasting av $shc"
		# Hidden Years Colors
		pwd
		startVarselSingle $shc
		download 'http://elfquest.com/read/SHC/shc-$p.jpg'
		sluttVarselSingle $shc
		cd ../
		pwd
	fi

# SAS
	if [[ -d "$eq - $sas" ]]; then
		echo "$eq - $sas finnes allerede."
	else
		echo "Starter nedlasting av $sas"
		mkdir "$eq - $sas"
		cd "$eq - $sas"
		pwd
		startVarselSingle $sas
		download 'http://elfquest.com/read/SAS/sas-$p.jpg'
		sluttVarselSingle $sas
		cd ../
		pwd
	fi

# The Discovery
	if [[ -d "$eq - $disc" ]]; then
		echo "$eq - $disc finnes allerede."
	else
		echo "Starter nedlasting av $disc"
		mkdir "$eq - $disc"
		cd "$eq - $disc"
		pwd
		startVarselSingle $disc
		download 'http://elfquest.com/read/DISC/disc-$p.jpg'
		sluttVarselSingle $disc
		cd ../
		pwd
	fi

# Ten Chiefs
	if [[ -d "$eq - $tc" ]]; then
		echo "$eq - $tc finnes allerede."
	else
		echo "Starter nedlasting av $tc"
		mkdir "$eq - $tc"
		cd "$eq - $tc"
		for i in {01..20}
		do
			pwd
			startVarsel $tc $i
			download 'http://elfquest.com/read/TC/TC$i/tc$i-$p.jpg'
			sluttVarsel $tc $i
		done
		cd ../
		pwd
	fi

# In All But Blood
	if [[ -d "$eq - $iabb" ]]; then
		echo "$eq - $iabb finnes allerede."
	else
		echo "Starter nedlasting av $aibb"
		mkdir "$eq - $iabb"
		cd "$eq - $iabb"
		pwd
		startVarselSingle $iabb
		download 'http://elfquest.com/read/IABB/iabb-$p.jpg'
		sluttVarselSingle $iabb
		cd ../
		pwd
	fi

# New Blood
	if [[ -d "$eq - $nb" ]]; then
		echo "$eq - $nb finnes allerede."
	else
		echo "Starter nedlasting av $nb"
		mkdir "$eq - $nb"
		cd "$eq - $nb"
		for i in {01..35}
		do
			pwd
			startVarsel $nb $i
			download 'http://elfquest.com/read/NB/NB$i/nb$i-$p.jpg'
			sluttVarsel $nb $i
		done
		echo "Starter nedlasting av $nbss2"
		# New Blood Summer Special 2
		pwd
		startVarselSingle $nbss2
		download 'http://elfquest.com/read/NB/NBSS2/nbss2-$p.jpg'
		sluttVarselSingle $nbss2
		cd ../
		pwd
	fi

# Wavedancers
	if [[ -d "$eq - $wd" ]]; then
		echo "$eq - $wd finnes allerede."
	else
		echo "Starter nedlasting av $wd"
		mkdir "$eq - $wd"
		cd "$eq - $wd"
		pwd
		startVarselSingle $wd
		download 'http://elfquest.com/read/WD/WD01/wd1-$p.jpg'
		download 'http://elfquest.com/read/WDa/awd-$p.jpg'
		download 'http://elfquest.com/read/WDX/wdx-$p.jpg'
		sluttVarselSingle $wd
		cd ../
		pwd
	fi

# Wild Hunt
	if [[ -d "$eq - $wh" ]]; then
		echo "$eq - $wh finnes allerede."
	else
		echo "Starter nedlasting av $wh"
		mkdir "$eq - $wh"
		cd "$eq - $wh"
		pwd
		startVarselSingle $wh
		download 'http://elfquest.com/read/WH/awh-$p.jpg'
		sluttVarselSingle $wh
		cd ../
		pwd
	fi

# Khavi
	if [[ -d "$eq - $ka" ]]; then
		echo "$eq - $ka finnes allerede."
	else
		echo "Starter nedlasting av $ka"
		mkdir "$eq - $ka"
		cd "$eq - $ka"
		pwd
		startVarselSingle $ka
		download 'http://elfquest.com/read/KA/KA01/ka01-0.jpg' # First cover from the regular issue
		download 'http://elfquest.com/read/KAC/kac-$p.jpg'
		sluttVarselSingle $ka
		cd ../
		pwd
	fi

# Two-Spear
	if [[ -d "$eq - $ts" ]]; then
		echo "$eq - $ts finnes allerede."
	else
		echo "Starter nedlasting av $ts"
		mkdir "$eq - $ts"
		cd "$eq - $ts"
		for i in {01..05}
		do
			pwd
			startVarsel $ts $i
			download 'http://elfquest.com/read/TS/TS$i/ts$i-$p.jpg'
			sluttVarsel $ts $i
		done
		cd ../
		pwd
	fi

# Rogue's Curse
	if [[ -d "$eq - $rc" ]]; then
		echo "$eq - $rc finnes allerede."
	else
		echo "Starter nedlasting av $rc"
		mkdir "$eq - $rc"
		cd "$eq - $rc"
		pwd
		startVarselSingle $rc
		download 'http://elfquest.com/read/RC/arc-$p.jpg'
		sluttVarselSingle $rc
		cd ../
		pwd
	fi

# Jink
	if [[ -d "$eq - $jk" ]]; then
		echo "$eq - $jk finnes allerede."
	else
		echo "Starter nedlasting av $jk"
		mkdir "$eq - $jk"
		cd "$eq - $jk"
		for i in {01..12}
		do
			pwd
			startVarsel $jk $i
			download 'http://elfquest.com/read/JK/JK$i/jk$i-$p.jpg'
			sluttVarsel $jk $i
		done
		cd ../
		pwd
	fi

# The Rebels
	if [[ -d "$eq - $rb" ]]; then
		echo "$eq - $rb finnes allerede."
	else
		echo "Starter nedlasting av $rb"
		mkdir "$eq - $rb"
		cd "$eq - $rb"
		for i in {01..12}
		do
			pwd
			startVarsel $rb $i
			download 'http://elfquest.com/read/RB/RB$i/rb$i-$p.jpg'
			sluttVarsel $rb $i
		done
		cd ../
		pwd
	fi

# Future Quest
	if [[ -d "$eq - $fq" ]]; then
		echo "$eq - $fq finnes allerede."
	else
		echo "Starter nedlasting av $fq"
		mkdir "$eq - $fq"
		cd "$eq - $fq"
		pwd
		startVarselSingle $fq
		download 'http://elfquest.com/read/FQ/afq-$p.jpg'
		sluttVarselSingle $fq
		cd ../
		pwd
	fi

# Fire Eye
	if [[ -d "$eq - $fe" ]]; then
		echo "$eq - $fe finnes allerede."
	else
		echo "Starter nedlasting av $fe"
		mkdir "$eq - $fe"
		cd "$eq - $fe"
		pwd
		startVarselSingle $fe
		download 'http://elfquest.com/read/FE/afe-$p.jpg'
		sluttVarselSingle $fe
		cd ../
		pwd
	fi

echo ""
echo "==========================="
echo "Ferdig med nedlastingene."
date
echo "==========================="
echo ""
exit 0