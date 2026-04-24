<#
    Script Name : Empty Recycle Bin.ps1
    Description : Shows recycle bin item count and total size, then empties it after confirmation.
    Author      : kardelitaitu
    Version     : 1.1.0
    Date        : April 24, 2026
    License     : MIT
#>

$drivePaths = Get-PSDrive -PSProvider FileSystem | ForEach-Object {
    Join-Path $_.Root '$Recycle.Bin'
} | Where-Object { Test-Path $_ }

Write-Host -NoNewline "Scanning Recycle Bin..."

$items = foreach ($root in $drivePaths) {
    Get-ChildItem -LiteralPath $root -Force -Recurse -File -ErrorAction SilentlyContinue
}

Write-Host " done"
Write-Host -NoNewline "Calculating total size..."

$count = @($items).Count
$totalBytes = ($items | Measure-Object -Property Length -Sum).Sum
if (-not $totalBytes) { $totalBytes = 0 }

$totalMB = [math]::Round($totalBytes / 1MB, 2)
$totalGB = [math]::Round($totalBytes / 1GB, 2)

Write-Host " done"
Write-Host "============================================"
Write-Host "Recycle Bin items: $count"
Write-Host "Total size: $totalBytes bytes"
Write-Host "Total size: $totalMB MB / $totalGB GB"
Write-Host "============================================"

if ($count -eq 0) {
    Write-Host "Recycle Bin is already empty."
    pause
    exit 0
}

$confirm = Read-Host "Type YES to empty the Recycle Bin"
if ($confirm -ne "YES") {
    Write-Host "Cancelled."
    pause
    exit 0
}

$shell = New-Object -ComObject Shell.Application
$shell.NameSpace(0xA).Self.InvokeVerb("empty")
Write-Host "Recycle Bin emptied."
pause
