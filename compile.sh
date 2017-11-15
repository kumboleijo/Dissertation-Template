#!/bin/bash

cd "$(dirname -- "$0")"
dir="$PWD"
echo "$dir"

latex Ausarbeitung
bibtex Ausarbeitung
pdflatex Ausarbeitung

latex Expose
bibtex Expose
pdflatex Expose

latex Notes
bibtex Notes
pdflatex Notes.tex

rm *.bbl
rm *.blg
rm *.dvi
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