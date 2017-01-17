#
#echo "$1"
ffmpeg -y -i "$1" -movflags +faststart -map 0:0 -map 0:1 -map 0:1 -c:v copy -c:a:0 aac -c:a:1 copy "${1%mkv}mp4".mp4
