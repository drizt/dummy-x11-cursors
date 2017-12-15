#!/bin/bash
mkdir -p dummy-theme/png
mkdir -p dummy-theme/cursors
rm -f dummy-theme/png/*
rm -f dummy-theme/cursors/*
cat /dev/null > dummy-theme/dummy-indexes.txt
k=1
for f in names/*; do
	f=$(basename "${f}")
	echo ${f}
	convert -size 24x24                   \
		-background none -fill 'red'        \
		-draw 'point 0,0' -draw 'point 1,1' \
		-draw 'point 1,0' -draw 'point 0,1' \
		-draw 'point 2,0' -draw 'point 0,2' \
		-pointsize 13 label:${k}            \
		dummy-theme/png/${f}.png
	echo "24 0 0 dummy-theme/png/${f}.png" | xcursorgen > dummy-theme/cursors/${f}
	echo ${k} ${f} >> dummy-theme/dummy-indexes.txt
	((k++))
done
