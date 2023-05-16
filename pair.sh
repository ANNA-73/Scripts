#!/bin/bash

# Define the input directory where the files are located
input_dir="/projects/b1180/Anna/bettina"

# Create an associative array to store the pairs
declare -A file_pairs

# Iterate over the files in the input directory
for file in "$input_dir"/*.fastq; do
    # Extract the file name without extension
    file_name=$(basename "$file" .fastq)
    
    # Extract the identifier part before "_R"
    identifier="${file_name%%_R*}"
    
    # Extract the R number
    r_number="${file_name##*_R}"
    
    # Check if the pair already exists in the associative array
    if [[ -n ${file_pairs[$identifier]} ]]; then
        # Append the current file to the existing pair
        file_pairs[$identifier]+=" $file"
    else
        # Create a new pair with the current file
        file_pairs[$identifier]="$file"
    fi
done

# Iterate over the pairs and print them on the same line
for pair in "${!file_pairs[@]}"; do
    files=${file_pairs[$pair]}
    echo "Pair: $pair"
    echo "Files: $files"
done
