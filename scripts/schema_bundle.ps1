# Check if npm is installed
if (-not (Get-Command "npm" -ErrorAction SilentlyContinue)) {
    Write-Error "npm is not installed. Please install Node.js and npm first."
    exit 1
}

# List of available schemas
$Schemas = @("exampleUrlScheme.json", 
            "feedURLscheme.json", 
            "healthURLScheme.json",
            "managementURLScheme.json",
            "milkURLScheme.json",
            "performanceURLScheme.json",
            "registrationURLScheme.json",
            "reproductionURLScheme.json",
            "sortingURLScheme.json")

$BundledSchemasPath = "../bundled-schemes"

# Remove old bundled schemas
if (Test-Path -Path $BundledSchemasPath) {
    Write-Output "Cleaning up old bundled schemas in $BundledSchemasPath..."
    Remove-Item -Path "$BundledSchemasPath\*" -Force
    Write-Output "Old bundled schemas cleaned up."
} else {
    Write-Warning "$BundledSchemasPath not found. Skipping cleanup."
}

# Iterate over each schema
foreach ($Schema in $Schemas) {
    $InputFile = Join-Path "../url-schemes" $Schema
    $OutputFile = Join-Path $BundledSchemasPath $Schema

    if (Test-Path -Path $InputFile) {
        Write-Output "Bundling $InputFile..."
        try {
            & npx --yes @redocly/cli bundle $InputFile -o $OutputFile
            Write-Output "Bundled $InputFile to $OutputFile successfully."
        } catch {
            Write-Error "Failed to bundle $InputFile. Error: $_"
        }
    } else {
        Write-Warning "Input file $InputFile not found. Skipping."
    }
}

Write-Output "Bundle completed."