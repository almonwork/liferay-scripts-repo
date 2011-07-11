#!/bin/bash
MUSER="$1"
MPASS="$2"
MDB="$3"
 
# Detect the paths for the MySQL command
MYSQL=$(which mysql)
 
if [ $# -ne 3 ]
then
	echo "Usage: $0 {MySQL-User-Name}{MySQL-Password}{MySQL-Database-Name}"
	echo "Deletes and (re) create the indicated database"
	exit 1
fi

echo "Deleting database $MDB ..."
$MYSQL -u $MUSER -p$MPASS -e "DROP SCHEMA $MDB"
echo "Creating the schema $MDB . . ."
$MYSQL -u $MUSER -p$MPASS -e "CREATE SCHEMA $MDB DEFAULT CHARACTER SET utf8 ;"
