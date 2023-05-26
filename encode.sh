#! /bin/bash

IN_FILE=`zenity --file-selection --title="Select the anime file"`
FILE_CUT=`echo "$IN_FILE" | cut -d "." -f 1`
OUT_FILE=`echo "$FILE_CUT(1).mkv"`
TITLE=`echo ${FILE_CUT##*/}`

ffmpeg -i "$IN_FILE" -c:v hevc_nvenc -preset p7 -cq 30 -metadata title="$TITLE" -map 0 "$OUT_FILE"
