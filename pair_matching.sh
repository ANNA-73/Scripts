#!/bin/bash

dirpath=$1
shift

nums=("$@")

cd "$dirpath"

for file1 in *; do
  num1=$(echo "$file1" | grep -Eo '[0-9]+')
  if [[ -n $num1 ]]; then
    for num in "${nums[@]}"; do
      if [[ "$num1" == "$num" ]]; then
        for file2 in *; do
          num2=$(echo "$file2" | grep -Eo '[0-9]+')
          if [[ -n $num2 && "$file1" != "$file2" && "$num1" == "$num2" && "$file1" < "$file2" ]]; then
            echo "$file1 matches with $file2"
          fi
        done
      fi
    done
  fi
done
