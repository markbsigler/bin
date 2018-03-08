#!/bin/sh
 
# -profile:v high -level 5 -crf 18 -maxrate 10M -bufsize 16M -pix_fmt yuv420p 
# -vf scale=iw*sar:ih, scale='if(gt(iw,ih),min(1920,iw),-1)':'if(gt(iw,ih),-1,min(1080,ih))'" 
# -x264opts bframes=3:cabac=1 -movflags faststart
# aflags="-b:a 320k -y"

fflags=""	#-flags +global_header"
orig="mp4"     #File type to convert  (mp4,avi,mkv)
new="mp4"      #format to convert into (mp4,avi,mkv)
vcode="copy"   #codec to copy video to (copy, libx264, mpeg4)
acode="libfdk_aac"   #codec to copy audio to (copy, aac, ac3, dts)
scode="copy"   #codec to copy subtitles to (copy, mov_text)
subtitles="yes" #copy subtitles or not (yes, no)
 
 
#for f in *$orig; do echo "$(basename "$f" $orig)$new"; done
 
#look for all files matching orig designator
for f in *.$orig;
do
 
#create output filename
output=$(basename "$f" .$orig).$new;
 
#build subs request
if [ "$subtitles" = "yes" ]
then
     subs="-scodec $scode"
else
     subs="-sn"
fi 
 
#check for faststart
if [ "$new" = "mp4" ]
then
fast="-movflags +faststart"
else
fast=""
fi
 
#execute ffmpeg
#echo ffmpeg $fflags -i "$f" -vcodec $vcode -acodec $acode $subs $fast "$output"; 
ffmpeg $fflags -i  "$f" -vcodec $vcode -acodec $acode $subs $fast "$output";
 
#end processing loop
done
