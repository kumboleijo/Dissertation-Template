#!/bin/bash

cd "$(dirname -- "$0")"
dir="$PWD"
cd 00_Data/00_Chapters

VERSION="1.0"
echo
echo --------------------------------------
echo LaTex count script by Kumboleijo
echo Version: "$VERSION"
echo --------------------------------------
echo

texcount chapter1.tex chapter2.tex chapter3.tex chapter4.tex chapter5.tex -sum
