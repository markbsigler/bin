#!/bin/sh
bnm=""
reldt=""
time="0000.00"
for file in $(find . -maxdepth 2 -type f -name *.nfo)
do
	reldt=$(grep "releasedate" $file | sed -e 's/<releasedate>//' -e 's/<\/releasedate>//' | sed -e 's/-//g')
	if [ -n "$reldt" ]
	then
		touch -c -t $reldt$time $(dirname $file)
		touch -c -t $reldt$time $(dirname $file)/*
		reldt=""
#	else
#		echo "No release date or nfo for: $file"
	fi
done

