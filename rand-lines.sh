#!/bin/bash

# Grab number of random lines from a file
# based on solution by Dennis Williamson from stackoverflow
# https://stackoverflow.com/questions/12182910/using-awk-to-pull-specific-lines-from-a-file
# awk 'NR == FNR {nums[$1]; next} FNR in nums' numberfile datafile
# 
# Just added the jot-based filehandle instead of 'numberfile' and made the awk-code unnecessarily verbose (for awk n00bs as myself)

if [[ -z "$1" ]] || [[ -z "$2" ]] ; then
    echo "usage: $0 n_lines file" ; exit 1;
fi

N_LINES="$1" # Number of Lines to Grab
FILE="$2" # Source File

if [[ ! -r "${FILE}" ]] ; then
    echo "file (${FILE}) not readable exiting." ; exit 2;
fi

# How does it work?
# 
# NR - record number
# FNR - file record number
# if (NR==FNR) we add the line-number to the array of wanted linenumbers (nums)
# if (FNR found in array) we print the line (print-statement added for clarity (default behaviour))
# $(wc -l < "$FILE") -> returns number of lines in file
# <(jot -r $N 1 $(wc -l < "$FILE")) -> returns a filehandle containing $N random numbers from 1 - $(wc -l < "$FILE")
awk '(NR==FNR) { nums[$1]; next } (FNR in nums) { print }' <(jot -r $N_LINES 1 $(wc -l < "$FILE")) "$FILE"

# could also be written as:
# awk 'NR==FNR {nums[$1]; next} (FNR in nums)' <(jot -r $N 1 $(wc -l < "$FILE")) "$FILE"
