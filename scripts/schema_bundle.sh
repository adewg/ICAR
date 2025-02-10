#!/bin/sh

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "Error: npm is not installed. Please install Node.js and npm first." >&2
    exit 1
fi

# List of available schemas
schemas=(
    "exampleUrlScheme.json"
    "feedURLscheme.json"
    "healthURLScheme.json"
    "managementURLScheme.json"
    "milkURLScheme.json"
    "performanceURLScheme.json"
    "registrationURLScheme.json"
    "reproductionURLScheme.json"
    "sortingURLScheme.json"
)

BundledSchemasPath="../bundled-schemes"

# Remove old bundled schemas
if [ -d "$BundledSchemasPath" ]; then
    echo "Cleaning up old bundled schemas in $BundledSchemasPath..."
    rm -rf "$BundledSchemasPath"/*
    echo "Old bundled schemas cleaned up."
else
    echo "$BundledSchemasPath not found. Skipping cleanup."

    # Ensure the folder exists
    mkdir -p "$BundledSchemasPath"
    echo "$BundledSchemasPath folder created."
fi

# Iterate over each schema
for schema in "${schemas[@]}"; do
    input_file="../url-schemes/$schema"
    output_file="$BundledSchemasPath/$schema"

    # Check if the input file exists
    if [[ -f "$input_file" ]]; then
        echo "Bundling $input_file..."
        # Run openapi-generator-cli to bundle the file
        if npx --yes @redocly/cli bundle "$input_file" -o "$output_file"; then
            echo "Bundled $input_file to $output_file successfully."
        else
            echo "Failed to bundle $input_file." >&2
        fi
    else
        echo "Input file $input_file not found. Skipping."
    fi
done

echo "Bundle completed."