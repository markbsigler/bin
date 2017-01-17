#!/bin/bash
for a in *.flac; do
infile="${a}"
echo "$infile"
outfile="${a[@]/%flac/mp3}"
echo "$outfile"
  ffmpeg -i "${infile}" -codec:a libmp3lame "${outfile}"
done
