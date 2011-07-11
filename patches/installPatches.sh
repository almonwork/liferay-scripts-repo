#!/bin/bash

# install-patches.sh
# Instructions:
#  1. create a dir, copy the script and desired patches in that dir.
#  2. chechk/set values for AS_BASE_DIR, LR_CLASSES_DIR, GLOBAL_LIB_DIR and LR_DEPLOY_DIR
#  3. To install patches, run the script. Pass -u to uninsntall
# App server should be stopped prior to running this script

#
# useful dirs
#

# base app server dir
AS_BASE_DIR="/home/liferay/Oracle/Middleware/user_projects/domains/base_domain"
# exploded liferay WAR classes dir
LR_CLASSES_DIR="$AS_BASE_DIR/servers/AdminServer/tmp/_WL_user/liferay-portal-6/vjuxty/war/WEB-INF/classes"
# global app server lib dir
GLOBAL_LIB_DIR="$AS_BASE_DIR/lib/"
# Liferay deploy dir (no always is the same than app server deploy dir)
LR_DEPLOY_DIR="$AS_BASE_DIR/../deploy/"

#
# file filters
#
FILTER_IMPL="lp*portal-impl*.jar"
FILTER_SERVICE="lp*portal-service*.jar"
FILTER_HOOK="lp*hook.war"

function uninstall_patches() {
	echo "Uninstalling patches..."
	#TODO only remove files present in unzip -v $FILTER_IMPL
        rm -Rf $LR_CLASSES_DIR/com/
        rm $GLOBAL_LIB_DIR$FILTER_SERVICE
        rm $LR_DEPLOY_DIR$FILTER_HOOK
}

function install_patches() {
	uninstall_patches
	echo "Installing patches..."
	for i in `ls $FILTER_IMPL`;
	do
		unzip -o $i -d $LR_CLASSES_DIR
	done

	cp $FILTER_SERVICE $GLOBAL_LIB_DIR
	cp $FILTER_HOOK $LR_DEPLOY_DIR
}

if [ -z $1 ]; 
then
	install_patches
else
	if [ $1 == "-u" ];
	then
		uninstall_patches
	fi;
fi;
