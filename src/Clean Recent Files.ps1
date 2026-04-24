<# 
    Script Name : Clean Recent Files.ps1
    Description : Shows recent-file items and removes them after confirmation.
    Author      : kardelitaitu
    Version     : 1.0.0
    Date        : April 24, 2026
    License     : MIT
#>

$recentPath = Join-Path $env:APPDATA 'Microsoft\Windows\Recent'

if (-not (Test-Path $recentPath)) {
    Write-Host "Recent files folder not found."
    pause
    exit 0
}

$items = Get-ChildItem -LiteralPath $recentPath -Force -ErrorAction SilentlyContinue

Write-Host "Items to delete from Recent Files:"
Write-Host "============================================"
$items | ForEach-Object { Write-Host $_.FullName }
Write-Host "============================================"

if (-not $items) {
    Write-Host "No recent files found."
    pause
    exit 0
}

$confirm = Read-Host "Type YES to delete these recent file shortcuts"
if ($confirm -ne "YES") {
    Write-Host "Cancelled."
    pause
    exit 0
}

$items | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
Write-Host "Recent files cleaned."
pause
