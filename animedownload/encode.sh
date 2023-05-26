#! /bin/bash

FILE_CUT=`echo "$1" | cut -d "." -f 1`
OUT_FILE=`echo "$FILE_CUT(1).mkv"`
TITLE=`echo ${FILE_CUT##*/}`

ffmpeg -i "$1" -c:v hevc_nvenc -preset p7 -cq 30 -metadata title="$TITLE" -map 0 "$OUT_FILE"
