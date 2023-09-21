#!/bin/bash 

# Check if an argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <tar_archive.tgz>"
    exit 1
fi

# Check if the provided file exists
if [ ! -f "$1" ]; then
    echo "Error: The provided file '$1' does not exist."
    exit 1
fi

# Create a temporary scratch directory
scratch_dir=$(mktemp -d)

# Extract the contents of the tar archive into the scratch directory
tar -zxf "$1" -C "$scratch_dir"

# Remove files containing the line "DELETE ME!"
find "$scratch_dir" -type f -exec grep -l "DELETE ME!" {} + | xargs rm

base_name=$(basename "$1")
new_name="cleaned_${base_name}"

# Change to the scratch directory
pushd "$scratch_dir"

# Create the new tar archive
tar -czf "$new_name" *

# Move the new tar archive to the original directory
popd
mv "${scratch_dir}/${new_name}" .

# Clean up: Remove the scratch directory and its contents
rm -r "$scratch_dir"

echo "Temporary scratch directory removed."

