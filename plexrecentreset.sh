#!/bin/sh

if ! [ -x "$(command -v sqlite3)" ] 
then
	echo 'Please install the sqlite3\n' >&2

	exit 1
else
	SQL_BIN=`which sqlite3`
fi

DB="/var/lib/plexmediaserver/Library/Application Support/Plex Media Server/Plug-in Support/Databases/com.plexapp.plugins.library.db"

if ! [ -w "$DB" ]
then
	echo "\n$DB\nDatabase file permissions do not allow you to update.\n" >&2

	exit 1
else
	echo "\nUpdating added date to match release date.\n"
fi

SQL_UPDATE="UPDATE metadata_items SET added_at = originally_available_at WHERE ((originally_available_at != added_at) AND (originally_available_at IS NOT NULL));"

SQL_QUERY="SELECT title,originally_available_at,added_at FROM metadata_items"

$SQL_BIN "$DB" "$SQL_UPDATE"

$SQL_BIN "$DB" "$SQL_QUERY"
