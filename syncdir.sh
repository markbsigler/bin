#!/bin/sh
for a in "`cat ${1}`" 
rsync -avz --progress --exclude '*@SynoResource' --exclude '@eaDir' --exclude '*.vsmeta' --exclude '.DS_Store' /volume1/Media/Music/${a} admin@192.168.0.50:/share/Multimedia/Music
#do echo "${a}"; 
done
