#!/bin/bash

cd "$(dirname -- "$0")"
dir="$PWD"
echo "$dir"

# latex Ausarbeitung
pdflatex Ausarbeitung
bibtex Ausarbeitung
makeindex Ausarbeitung
pdflatex Ausarbeitung
pdflatex Ausarbeitung


# latex Expose
pdflatex Expose
bibtex Expose
makeindex Expose
pdflatex Expose
pdflatex Expose


# latex Exzerpt
pdflatex Exzerpt
bibtex Exzerpt
makeindex Exzerpt
pdflatex Exzerpt
pdflatex Exzerpt


# latex Notes
pdflatex Notes
bibtex Notes
makeindex Notes
pdflatex Notes
pdflatex Notes


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
rm *.out
rm *.nlo
rm *.ilg
rm *.ind


rm 00_Data/*.aux
rm 00_Data/00_Chapters/*.aux

mkdir 01_Exports
mv *.pdf 01_Exports
