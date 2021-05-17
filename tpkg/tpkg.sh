#!/bin/bash

#Ping Send to Check Server Connection
set ping_check="raw.githubusercontent.com"

# Select Here Package Repository
set package_repo="https://raw.githubusercontent.com/Hawk2811/termux-packages/main/stable/"
#set package_repo="https://raw.githubusercontent.com/Hawk2811/termux-packages/main/unstable/"
#set package_repo="yourrepository.com/unstable"

function update(){
	echo Creating Cache Dir
	mkdir ~/.tpkg_cache
	mkdir ~/.tpkg_extract_dir
	ping -c 8 $ping_check
	exit 0
}

function install(){
	local pkg="$2"
	[[ -z $pkg ]] && { echo "tpkg: Package Not specified"; exit 1; }
	wget $package_repo$pkg.zip -O ~/.tpkg_cache/$pkg.zip
	pv | unzip ~/.tpkg_cache/$pkg.zip -o -z ~/.tpkg_extract_dir/$pkg
	echo tpkg: Try Running Postinstall Script
	if [ -f "~/.tpkg_extract_dir/$pkg/setup.sh" ]; then
    	echo "Postinstall Script FOUND"
    	echo "bash ~/.tpkg_extract_dir/$pkg/setup.sh"
    	bash ~/.tpkg_extract_dir/$pkg/setup.sh
	else 
    	echo "tpkg: Error Postinstall Script Not Found"
	fi
	exit 0

}
echo tpkg: Usage: tpkg update or tpkg install packagename
