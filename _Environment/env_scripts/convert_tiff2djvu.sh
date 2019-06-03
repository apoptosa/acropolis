#!/bin/bash

#Avoid problem when a directory is devoid of .tif
#shopt -s nullglob

echo "Simple script to convert a directory load of .tiff files to a single djvu"
echo "Usage:"
echo "tiff2djvu sourcedirectory output.djvu"
echo " "
echo " "

#INPUT VARS
WORKDIR=$1
OUTPUTNAME=$2


if [[ $1 == "" ]]; then
	echo "Warning: no input directory passed"
	echo "Setting PWD as input directory"
	echo " "
	WORKDIR=$PWD
fi

if [[ $2 == "" ]]; then
	echo "Warning: no output filename specified"
	echo "Setting out.djvu as output filename"
	echo " "
	OUTPUTNAME=out.djvu
fi



IMGFILES=$WORKDIR/*.tif

for f in $IMGFILES
do
	echo "Processing $f..."
	#First we convert the present file to a .pbm
	convert $f $f.pbm
	cjb2 -clean -dpi 600 $f.pbm $f.djvu
	rm $f.pbm
done

djvm -c $WORKDIR/$OUTPUTNAME $WORKDIR/*.djvu

echo " "
echo "All done! See $WORKDIR$OUTPUTNAME"
