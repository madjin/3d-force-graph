#!/bin/bash

mkdir -p circle

for file in *.png; do
  width=$(identify -format "%[fx:w]" "${file}")
  height=$(identify -format "%[fx:h]" "${file}")
  convert "${file}" -size "${width}x${height}" xc:transparent -bordercolor none -border "${width/2}x${height/2}" \
    \( +clone -alpha extract -draw "circle ${width/2+0.5},${height/2+0.5} ${width/2-0.5},${height/2-0.5}" -alpha off \) \
    -compose CopyOpacity -composite -shave "${width/2}x${height/2}" "circle/${file}"
done
