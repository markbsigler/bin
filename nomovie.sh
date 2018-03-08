#!/bin/sh
#
# find subdirectories that don't contain mp4 or mkv files in movies library
#

find /Shares/Media/Movies -maxdepth 1 -mindepth 1 -type d '!' -exec sh -c 'ls -1 "{}"|egrep -iq "mp4$|mkv$|avi$" ' ';' -print

#for FILE in $(cat ./nm.txt); do echo $FILE; rm -rf $FILE; done
