# Check if npm is installed
if (-not (Get-Command "npm" -ErrorAction SilentlyContinue)) {
    Write-Error "npm is not installed. Please install Node.js and npm first."
    exit 1
}

# Check if OpenAPI CLI is installed; install if missing
if (-not (Get-Command "openapi" -ErrorAction SilentlyContinue)) {
    Write-Output "OpenAPI CLI not found. Installing..."
    npm install -g @redocly/openapi-cli
    Write-Output "OpenAPI CLI installed successfully."
} else {
    Write-Output "OpenAPI CLI is already installed."
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

foreach ($Schema in $Schemas) {
    $InputFile = Join-Path "url-schemes" $Schema
    $OutputFile = Join-Path "merged-schemes" $Schema

    if (Test-Path -Path $InputFile) {
        Write-Output "Bundling $InputFile..."
        try {
            & openapi bundle $InputFile -o $OutputFile
            Write-Output "Bundled $InputFile to $OutputFile successfully."
        } catch {
            Write-Error "Failed to bundle $InputFile. Error: $_"
        }
    } else {
        Write-Warning "Input file $InputFile not found. Skipping."
    }
}

Write-Output "Bundle completed."