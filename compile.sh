#!/bin/bash

cd "$(dirname -- "$0")"
dir="$PWD"

VERSION="1.1.0"
echo
echo --------------------------------------
echo LaTex compile script by Kumboleijo
echo Version: "$VERSION"
echo --------------------------------------
echo

ARGUMENT="$1"
RELEASE="$2"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
echo $ARGUMENT
echo $RELEASE
echo $TIMESTAMP

if [ "$ARGUMENT" = "Ausarbeitung" ]
then
    echo start compiling wihtout parameters...
    echo

    if [ "$RELEASE" = "-release" ]
    then    
        pdflatex Ausarbeitung
        bibtex Ausarbeitung
        makeindex Ausarbeitung.nlo -s nomencl.ist -o Ausarbeitung.nls
        pdflatex Ausarbeitung
        pdflatex Ausarbeitung
    elif [ "$RELEASE" = "" ]
    then    
        pdflatex --jobname=Ausarbeitung_$TIMESTAMP Ausarbeitung
        bibtex Ausarbeitung
        makeindex Ausarbeitung.nlo -s nomencl.ist -o Ausarbeitung.nls
        pdflatex --jobname=Ausarbeitung_$TIMESTAMP Ausarbeitung
        pdflatex --jobname=Ausarbeitung_$TIMESTAMP Ausarbeitung
    else
        echo wrong use of RElEASE argument
        echo $RELEASE is unknown
        exit
    fi
    echo
    echo finished compiling
    echo
    echo make clean

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
    rm *.nls
    rm *_temp.tex
    rm *.fls
    rm *.fdb_latexmk
    rm *.synctex.gz

    rm 00_Data/*.aux
    rm 00_Data/00_Chapters/*.aux

    mkdir 01_Exports
    mv *.pdf 01_Exports
elif [ "$ARGUMENT" = "all" ]
then
    echo start compiling all files
    echo

    pdflatex Ausarbeitung
    bibtex Ausarbeitung
    makeindex Ausarbeitung.nlo -s nomencl.ist -o Ausarbeitung.nls
    pdflatex Ausarbeitung
    pdflatex Ausarbeitung

    pdflatex Expose
    bibtex Expose
    makeindex Expose
    pdflatex Expose
    pdflatex Expose

    pdflatex Exzerpt
    bibtex Exzerpt
    makeindex Exzerpt
    pdflatex Exzerpt
    pdflatex Exzerpt

    pdflatex Notes
    bibtex Notes
    makeindex Notes
    pdflatex Notes
    pdflatex Notes

    echo
    echo finished compiling
    echo
    echo make clean

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
    rm *.nls
    rm *_temp.tex
    rm *.fls
    rm *.fdb_latexmk
    rm *.synctex.gz

    rm 00_Data/*.aux
    rm 00_Data/00_Chapters/*.aux

    mkdir 01_Exports
    mv *.pdf 01_Exports

elif [ "$ARGUMENT" = "clean" ]
then
    echo
    echo make clean

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
    rm *.nls
    rm *_temp.tex
    rm *.fls
    rm *.fdb_latexmk
    rm *.synctex.gz

    rm 00_Data/*.aux
    rm 00_Data/00_Chapters/*.aux

    mkdir 01_Exports
    mv *.pdf 01_Exports

else
    echo start compiling "$ARGUMENT"
    echo

    pdflatex "$ARGUMENT"
    bibtex "$ARGUMENT"
    makeindex "$ARGUMENT".nlo -s nomencl.ist -o "$ARGUMENT".nls
    pdflatex "$ARGUMENT"
    pdflatex "$ARGUMENT"

    echo
    echo finished compiling
    echo
    echo make clean

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
    rm *.nls
    rm *_temp.tex
    rm *.fls
    rm *.fdb_latexmk
    rm *.synctex.gz

    rm 00_Data/*.aux
    rm 00_Data/00_Chapters/*.aux

    mkdir 01_Exports
    mv *.pdf 01_Exports
fi
echo
echo ready
echo
echo --------------------------------------
echo LaTex compile script by Kumboleijo
echo Version: "$VERSION"
echo --------------------------------------
echo
