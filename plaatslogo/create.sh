#!/bin/bash

#
# convert_to_png input output resolution factor
#
convert_to_png ()
{
	local factor
	local dpi
	local iconsize
	case $3 in
		ldpi ) 
			dpi=120
			factor=3
			iconsize=36
			;;
		mdpi )
			dpi=160
			factor=4
			iconsize=48
			;;
		hdpi )
			dpi=240
			factor=6
			iconsize=72
			;;
		xhdpi )
			dpi=320
			factor=8
			iconsize=96
			;;
	esac
	local zoom
	zoom=`echo "scale=2;( $4 / 3 * $factor)" | bc`
	rsvg-convert $1 --keep-aspect-ratio -f png -o $2 -z $zoom
}

convert_eps_to_svg ()
{
	for o in v h; do
		for EPS in src/eps/$o/*.eps; do
			SVG=`echo $EPS | sed "s/_CMYK//" | sed "s/eps/svg/g" | sed "s/\/$o\//\//" | sed "s/\(.*\)/\L\1/"`
			echo $EPS omzetten naar $SVG
			inkscape --verb FileSave --export-plain-svg=$SVG $EPS;
		done
	done
}


#
# convert_svg_to_png suffix factor
#
convert_svg_to_png()
{
	local suffix
	local factor

	suffix=$1
	factor=$2
	for o in v h; do
		for res in ldpi mdpi hdpi xhdpi; do
			for i in src/svg/*_$o.svg; do
				PNG=`echo $i | sed "s/svg$/png/" | sed "s/src/dst\/drawable-$res/" | sed "s/svg\///" | sed "s/.png/_$suffix.png/"` 
				convert_to_png $i $PNG $res $factor
			done
		done
	done
}

# to svg:
#convert_eps_to_svg

# to png:
convert_svg_to_png small 0.125
convert_svg_to_png big 0.5

