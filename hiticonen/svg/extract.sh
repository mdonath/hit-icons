#!/bin/bash

source icon-list.inc

OUTPUTDIR=extracted
rm -rf $OUTPUTDIR
mkdir $OUTPUTDIR
## now loop through the above array
for icon in "${iconlist[@]}"
do
  echo "$icon"
  inkscape hit-icons.svg --export-id=$icon --export-id-only --vacuum-defs --export-plain-svg=$OUTPUTDIR/$icon.svg
done

