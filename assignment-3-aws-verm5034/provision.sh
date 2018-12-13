#!/bin/bash

# **********************************
# script to automatically update the software packages on the instance, install Nginx, and copy files into the website document root directory
# **********************************

#assign variables

ACTION=${1}
VERSION=1.0.0

function show_version() {

echo "$VERSION"
}

function  remove_file() {

	sudo service nginx stop
	cd /usr/share/nginx/html
	sudo  rm index.html
	cd ~ 
	cd scripts/
	sudo yum remove nginx
}

function display_help() {

cat << EOF
---------------------------------------------------
OPTIONS:
	-v | --version Version of a file
	-h | --help Display the command help
	-r | --remove Remove/Unistall the Nginx

Examples:
	Version of a file:
		$ ${0} -v

	Display help:
		$ ${0} -h

	Uninstall Nginx:
		$ ${0} -r
----------------------------------------------------

EOF
}

case "$ACTION" in
	-h|--help)
		display_help
		;;
	-v|--version)
		show_version
		;;
	-r|--remove)
		remove_file
		;;
	*)
	sudo yum update
	sudo yum install nginx -y
	sudo chkconfig nginx on
	#cd /usr/share/nginx/html
	sudo aws s3 cp s3://verm5034-assignment-3/index.html /usr/share/nginx/html/index.html
	sudo service nginx start
	
	echo "     "
	echo "******** Usage ${0} {-v|-h|-r} *************"
	echo "     "
	exit 1
esac



