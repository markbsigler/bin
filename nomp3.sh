#!/bin/sh
#
# find subdirectories that don't contain mp3 files in music library
#

find /Shares/Media/Music -mindepth 2 -type d '!' -exec sh -c 'ls -1 "{}"|egrep -iq "mp3$" ' ';' -print
