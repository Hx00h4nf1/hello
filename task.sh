#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <your_file>"
    exit 1
fi

# Assign the input file to a variable
myfile="$1"

# Check if the file exists
if [ ! -f "$myfile" ]; then
    echo "File not found: $myfile"
    exit 1
fi

# Extract IPs using a more robust regex pattern
grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' "$myfile" | grep -E '^([0-9]{1,3}\.){3}[0-9]{1,3}$' | sort -u > extracted_ips.txt

# Display the content of the result file
cat extracted_ips.txt

