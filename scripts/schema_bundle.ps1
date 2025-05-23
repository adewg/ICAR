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
$UrlSchemesPath = "../url-schemes"
$CombineSchemeConfigPath = "../scripts/combine-schemes.json"

# Remove old bundled schemas
if (Test-Path -Path $BundledSchemasPath) {
    Write-Output "Cleaning up old bundled schemas in $BundledSchemasPath..."
    Remove-Item -Path "$BundledSchemasPath\*" -Recurse -Force 
    Write-Output "Old bundled schemas cleaned up."
} else {
    Write-Output "$BundledSchemasPath not found. Skipping cleanup."

    # Ensure the folder exists
    New-Item -ItemType Directory -Path $BundledSchemasPath | Out-Null
    Write-Output "$BundledSchemasPath folder created."
}

# Iterate over each schema
foreach ($Schema in $Schemas) {
    $InputFile = Join-Path $UrlSchemesPath $Schema
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

# Combine bundled schemes into the single file
if (Test-Path $UrlSchemesPath -PathType Container) {    
    if ((Get-ChildItem $UrlSchemesPath | Measure-Object).Count -gt 0) {
		try {
				& npx --yes openapi-merge-cli --config $CombineSchemeConfigPath			
				Write-Output "Schemes combined successfully."
		} catch {
			Write-Error "Failed to combine schemes. Error: $_"
		}
	}
} else {
    Write-Output "The folder $UrlSchemesPath is empty or does not exist."
}
