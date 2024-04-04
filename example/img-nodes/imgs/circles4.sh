#!/bin/bash

mkdir -p circle

for file in *.png; do
  convert "${file}" \( +clone -threshold -1 -negate -fill white -draw "circle $(identify -format %w "${file}" | awk '{print $1/2}'), $(identify -format %h "${file}" | awk '{print $1/2}') $(identify -format %w "${file}" | awk '{print $1/2}'), 0" \) \
    -alpha Off -compose copy_opacity -composite "circle/${file}"
done
