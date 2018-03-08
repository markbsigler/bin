#!/bin/sh

# Music
nohup rsync -avz --progress --exclude *@SynoResource --exclude @eaDir --exclude *.vsmeta --exclude .DS_Store /volume1/Media/Music admin@192.168.0.50:/share/Multimedia/Videos < /dev/null > ~/`date +"%F_%T"`.log &

# Photo
nohup rsync -avz --progress --exclude *@SynoResource --exclude @eaDir --exclude *.vsmeta --exclude .DS_Store /volume1/video/photo/* admin@192.168.0.50:/share/Multimedia/Photos < /dev/null > ~/`date +"%F_%T"`.log &

# Audiobooks
nohup rsync -avz --progress --exclude *@SynoResource --exclude @eaDir --exclude *.vsmeta --exclude .DS_Store /volume1/Media/Audiobooks admin@192.168.0.50:/share/Multimedia/ < /dev/null > ~/`date +"%F_%T"`.log &

# TV
nohup rsync -avz --progress --exclude *@SynoResource --exclude @eaDir --exclude *.vsmeta --exclude .DS_Store /volume1/video/TV_Shows admin@192.168.0.50:/share/Multimedia/Videos < /dev/null > ~/`date +"%F_%T"`.log &

# Movies
nohup rsync -avz --progress --exclude *@SynoResource --exclude @eaDir --exclude *.vsmeta --exclude .DS_Store /volume1/video/Movies admin@192.168.0.50:/share/Multimedia/Videos < /dev/null > ~/`date +"%F_%T"`.log &

# Music Videos
nohup rsync -avz --progress --exclude *@SynoResource --exclude @eaDir --exclude *.vsmeta --exclude .DS_Store /volume1/video/Concert_Collection admin@192.168.0.50:/share/Multimedia/Videos < /dev/null > ~/`date +"%F_%T"`.log &

# Surf
nohup rsync -avz --progress --exclude *@SynoResource --exclude @eaDir --exclude *.vsmeta --exclude .DS_Store /volume1/video/Surf_Collection admin@192.168.0.50:/share/Multimedia/Videos < /dev/null > ~/`date +"%F_%T"`.log &

# Software
nohup rsync -avz --progress --exclude *@SynoResource --exclude @eaDir --exclude *.vsmeta --exclude .DS_Store /volume1/video/software admin@192.168.0.50:/share/Public/ < /dev/null > ~/`date +"%F_%T"`.log &
