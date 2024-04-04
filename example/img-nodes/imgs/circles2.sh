#!/bin/bash

for file in *.png; do
  convert "${file}" \( +clone -alpha extract -virtual-pixel black -spread 10 -blur 0x3 -threshold 50% -spread 1 -blur 0x.7 \) \
    -morphology close disk:1 -alpha off -compose Copy_Opacity -composite -trim +repage circle/"${file}"
done
