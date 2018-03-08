#
#echo "$1"
ffmpeg -y -i "$1" -movflags +faststart -c:v copy -c:a libfdk_aac -b:a 384k -c:s copy "${1%mkv}mp4".mp4
