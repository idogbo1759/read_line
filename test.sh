#!/bin/bash

echo "Enter directory to search:"
read dir

if [ ! -d "$dir" ]; then
    echo "Directory $dir does not exist."
    exit 1
else
    echo "Searching for .txt files in the $dir directory."

    output_file="output.txt"

    cd "$dir"
    txt_files=$(ls *.txt 2> /dev/null)
    
    if [ -z "$txt_files" ]; then
        echo "No .txt files found in $dir."
        exit 1
    else
        for file in *.txt; do
            echo "Processing $file..."
            line_count=$(wc -l < "$file")
            echo "$file - Total lines: $line_count" >> "../$output_file"
        done
    fi

    echo "Output written to $output_file"
fi
