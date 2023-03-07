#!/bin/bash

dirpath1=$1  # path to directory containing r1 files
dirpath2=$2  # path to directory containing r2 files
shift 3
start=$1
shift
end=$1
shift

cd "$dirpath1"

for i in $(seq $start $end); do
  r1=""
  r2=""
  for file in *$i*; do
    if [[ "$file" == *"paired_1"* ]]; then
      r1="$dirpath1/$file"
    elif [[ "$file" == *"paired_2"* ]]; then
      r2="$dirpath2/$file"
    fi
  done
  if [[ "$r1" != "" && "$r2" != "" ]]; then
    echo  "-1  $r1, -2 $r2 -o asm-${r1:0:8}.fasta"  | tee -a "arranged_file.txt"
  fi
done