<# 
    Script Name : Clean Temp.ps1
    Description : Removes safe temporary files from the current user's temp folders.
    Author      : kardelitaitu
    Version     : 1.1.0
    Date        : April 24, 2026
    License     : MIT
#>

$paths = @(
    $env:TEMP,
    "$env:WINDIR\Temp"
)

$items = foreach ($path in $paths) {
    if (Test-Path $path) {
        Get-ChildItem -LiteralPath $path -Force -ErrorAction SilentlyContinue
    }
}

if (-not $items) {
    Write-Host "No temp files found."
    pause
    exit 0
}

Write-Host "The following items will be deleted:"
Write-Host "============================================"
$items | ForEach-Object { Write-Host $_.FullName }
Write-Host "============================================"

$confirm = Read-Host "Type YES to delete these items"
if ($confirm -ne "YES") {
    Write-Host "Cancelled."
    pause
    exit 0
}

foreach ($path in $paths) {
    if (Test-Path $path) {
        Write-Host "Cleaning: $path"
        Get-ChildItem -LiteralPath $path -Force -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
    }
}

Write-Host "Done."
pause
