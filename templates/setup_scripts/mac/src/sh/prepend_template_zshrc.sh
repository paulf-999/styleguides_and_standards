#!/bin/bash

# Input file containing content to prepend
input_file="src/sh/zshrc_template.txt"

# Read the content from the input file
prepend_content=$(<"$input_file")

# Create a temporary file
tmpfile=$(mktemp)

# Append the existing .zshrc content to the temporary file
cat ~/.zshrc >> "$tmpfile"

# Prepend the new content to the beginning of the temporary file
printf "%s\n%s" "$prepend_content" "$(cat ~/.zshrc)" > "$tmpfile"

# Replace the original .zshrc with the temporary file
mv "$tmpfile" ~/.zshrc
