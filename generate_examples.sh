#!/usr/bin/env bash
set -euox pipefail

# setup
cp oist_thesis.cls Examples/oist_thesis.cls
cd Examples
cp Thesis.tex Thesis_backup.tex

# Thesis final version
pdflatex Thesis.tex
bibtex Thesis.aux
pdflatex Thesis.tex
pdflatex Thesis.tex
mv Thesis.pdf Thesis_final_version.pdf

# Thesis temporary version
sed -i 's/\\documentclass\[final\]/\\documentclass\[temporary\]/' Thesis.tex
pdflatex Thesis.tex
bibtex Thesis.aux
pdflatex Thesis.tex
pdflatex Thesis.tex
mv Thesis.pdf Thesis_temporary_version.pdf

# cleanup
rm Thesis.*
mv Thesis_backup.tex Thesis.tex
cd ..
