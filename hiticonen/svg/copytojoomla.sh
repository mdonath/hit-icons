#!/bin/bash

DESTDIR=~/git/hit-joomla/com_kampinfo/media/images/

for iconsize in ldpi mdpi xxxhdpi
do
  echo "Copying ${iconsize}"
  rm -rf $DESTDIR/${iconsize}
  cp -r ${iconsize} $DESTDIR/${iconsize}
done

