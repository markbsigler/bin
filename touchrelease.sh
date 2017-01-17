#!/bin/sh
reldt=""
time="0000.00"
for file in $(find . -maxdepth 2 -type f -name *.nfo)
do
	reldt=$(grep "releasedate" $file | sed -e 's/<releasedate>//' -e 's/<\/releasedate>//' | sed -e 's/-//g')
	if [ -n "$reldt" ]
	then
		touch -c -t $reldt$time $file
		reldt=""
ls -l $file
	fi
done

