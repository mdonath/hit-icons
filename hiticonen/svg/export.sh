#!/bin/bash

source icon-list.inc

inputfile=hit-icons.svg

# iterate over different sizes
for sizedir in 25_ldpi 40_mdpi 178_xxxhdpi
do
  # determine size and outputdir
  sizedirarr=(${sizedir//_/ })
  size=${sizedirarr[0]}
  outputdir=${sizedirarr[1]}

  # (re)create outputdir
  rm -rf $outputdir
  mkdir -p $outputdir

  # iterate over all icons
  for icon in "${iconlist[@]}"
  do
    # strip prefix
    filename=${icon:9}
    echo "Creating $icon at $size x $size pixels"
    inkscape ${inputfile} --export-id $icon -e "${outputdir}"/$filename.png -w $size -h $size
  done
done
