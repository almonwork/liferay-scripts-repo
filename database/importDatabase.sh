#!/bin/bash
MUSER="$1"
MPASS="$2"
MDB="$3"
SCRIPT="$4"
 
# Detect the paths for the MySQL Import command
MYSQL=$(which mysql)
 
if [ $# -ne 4 ]
then
	echo "Usage: $0 {MySQL-User-Name}{MySQL-Password}{MySQL-Database-Name}{MySQL script}"
	echo "Import the script into the database"
	exit 1
fi

echo "Importing schema $MDB with $SCRIPT ..."
$MYSQL -u$MUSER -p$MPASS $MDB < $SCRIPT
