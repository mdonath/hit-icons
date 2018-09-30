#!/bin/bash

source icon-list.inc

# iterate over different sizes
for size in 25 48 178
do
  # (re)create outputdir
  OUTPUTDIR=${size}px
  rm -rf $OUTPUTDIR
  mkdir -p $OUTPUTDIR

  # iterate over all icons
  for icon in "${iconlist[@]}"
  do
    echo "Creating $icon at $size x $size pixels"
    inkscape hit-icons.svg --export-id $icon -e "${OUTPUTDIR}"/$icon.png -w $size -h $size
  done
done
