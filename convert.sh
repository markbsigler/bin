#!/bin/sh
 
#
# Example Usage: ~/bin/convert.sh /volume1/video/
#
 
#Directories must be defined without trailing slash
rootpath="."
 
#leave as is.
ffprobe="ffprobe"
ffmpeg="ffmpeg"
log="$rootpath/convert.log"
 
echo "This script will reencode audio from video files in: $1"
echo "Logfile is: $log"
 
#Check if any arguments were passed
if [ -z "$1" ]
then
        echo
        echo "Usage: convert.sh [DIR]"
        exit 0
else
        # create new/ empty log
        echo "----- START ------" > "$log"
        echo
        find $1 -name "*.mkv" -type f | while read f
        do
                echo "processing $f" >> "$log"
                # get number of audio streams
                #num_streams=$($ffprobe "$f" -show_streams 2>&1 | grep "codec_type=audio" -c)
                #echo "streams = $num_streams" >> "$log"
               
                # Detect what audio codec is being used:
                audio=$($ffprobe "$f" 2>&1 | grep Audio | sed -n '/Audio:/s/.*: \([a-zA-Z0-9]*\).*/\1/p' | sed 1q)
                echo "audio = $audio" >> "$log"
               
                ##  Set default mapping settings:
                mopts="-map 0"
                ##  Set default subtitle settings:
                sopts="-c:s copy"
                ##  Set default video settings:
                vopts="-c:v copy"
                ## Set default audio settings:
                aopts="-c:a:1 aac -b:a 640k "
                ##  Set extra settings:
                eopts=" -strict -2"
               
                case "$audio" in
                   aac|alac|mp3|mp2) echo "-----> no processing needed." >> "$log" ;;
                   "") echo "-----> can't determine audio, skipping" >> "$log" ;;
                   *)
                   
                                mv "$f" "$f"-1
                                #convert to aac surround
                                $ffmpeg -nostdin -y -i "$f"-1 $mopts $sopts $vopts $aopts $eopts "$f"
                               
                                fail=$?
                                case "$fail" in
                                        "0" )
                                                ##  put new file in place
                                                echo "-----> SUCCES" >> "$log"
                                                #remove old file
                                                rm -rf "$f"-1
                                                #set rights
                                                chmod 666 "$f"
                                                #first remove than add to synology index
                                                synoindex -D "$f" >> "$log"
                                                synoindex -A "$f" >> "$log"
                                   ;;
                                   * )
                                                echo "-----> FAIL" >> "$log"
                                                ##  revert back
                                                rm -rf "$f"
                                                mv "$f"-1 "$f"
                                   ;;
                                 esac
                   
                   ;;
                esac
 
        done
fi
 
exit 0
