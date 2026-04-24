<# 
    Script Name : Package Cleanup.ps1
    Description : Previews and removes safe temporary files after confirmation.
    Author      : kardelitaitu
    Version     : 1.1.0
    Date        : April 24, 2026
    License     : MIT
#>

$targets = @(
    "$env:LOCALAPPDATA\Temp",
    "$env:WINDIR\Temp"
)

$items = foreach ($target in $targets) {
    if (Test-Path $target) {
        Get-ChildItem -LiteralPath $target -Force -ErrorAction SilentlyContinue
    }
}

Write-Host "Scanning safe cleanup targets..."
$count = @($items).Count
$totalBytes = ($items | Measure-Object -Property Length -Sum).Sum
if (-not $totalBytes) { $totalBytes = 0 }
$totalMB = [math]::Round($totalBytes / 1MB, 2)
$totalGB = [math]::Round($totalBytes / 1GB, 2)

Write-Host "============================================"
Write-Host "Items found: $count"
Write-Host "Total size: $totalBytes bytes"
Write-Host "Total size: $totalMB MB / $totalGB GB"
Write-Host "============================================"

if ($count -eq 0) {
    Write-Host "No safe cleanup items found."
    pause
    exit 0
}

Write-Host "Items to be removed:"
Write-Host "--------------------------------------------"
$items | ForEach-Object { Write-Host $_.FullName }
Write-Host "--------------------------------------------"
Write-Host "Summary: $count items, $totalMB MB / $totalGB GB"

$confirm = Read-Host "Type YES to remove these items"
if ($confirm -ne "YES") {
    Write-Host "Cancelled."
    pause
    exit 0
}

foreach ($target in $targets) {
    if (Test-Path $target) {
        Write-Host "Cleaning: $target"
        Get-ChildItem -LiteralPath $target -Force -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
    }
}

Write-Host "Safe cleanup completed."
pause
