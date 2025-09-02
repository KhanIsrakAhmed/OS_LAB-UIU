#!/bin/bash
# Save current directory as base_dir
base_dir=$(pwd)

# 1. Prompt the user for a directory name
echo "Enter directory name:"
read directory_name

# Check if directory exists
if [ -d "$directory_name" ]; then
    echo "Directory exists. Proceeding..."
else
    echo "No such directory. Creating..."
    mkdir -p "$directory_name"
fi

# 2. Change into the directory
cd "$directory_name" || exit

# Prompt user for file extension
echo "Enter file extension (e.g. txt, log, sh):"
read file_ext

# 3. Iterate through files
# Create/clear the log file in base_dir
log_file="$base_dir/print.log"
> "$log_file"

# Find files with the given extension
find . -type f -name "*.$file_ext" | while read -r file; do
    # Filename only
    filename=$(basename "$file")

    # Word count
    wc_count=$(wc -w < "$file")

    # Determine size class
    if [ "$wc_count" -eq 0 ]; then
        size="Empty"
    elif [ "$wc_count" -le 50 ]; then
        size="Small"
    else
        size="Big"
    fi

    # Print to screen
    echo "File: $filename | Words: $wc_count | Size: $size"

    # Save to log file
    echo "File: $filename | Words: $wc_count | Size: $size" >> "$log_file"
done

echo "Output written to $log_file"
