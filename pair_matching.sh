#!/bin/bash

dirpath=$1

cd "$dirpath"

files=$(ls)

for file1 in $files; do
  num1=$(echo "$file1" | grep -o '[0-9]*')
  for file2 in $files; do
    num2=$(echo "$file2" | grep -o '[0-9]*')
    if [ "$file1" != "$file2" ] && [ "$num1" == "$num2" ] && [ "$file1" \< "$file2" ]; then
      echo "$file1 matches with $file2"
    fi
  done
done