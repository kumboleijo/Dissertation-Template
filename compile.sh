#!/bin/bash

echo "The script you are running has basename `basename $0`, dirname `dirname $0`"

cd `dirname $0`


pdflatex Ausarbeitung.tex
pdflatex Expose.tex
pdflatex Notes.tex

rm *.lol
rm *.aux
rm *.idx
rm *.lof
rm *.log
rm *.lot
rm *.toc

rm 00_Data/*.aux
rm 00_Data/00_Chapters/*.aux

mkdir 01_Exports
mv *.pdf 01_Exports