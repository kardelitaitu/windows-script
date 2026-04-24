<#
    Script Name : Update Winget.ps1
    Description : Updates winget sources, previews available upgrades, then upgrades all packages after confirmation.
    Author      : kardelitaitu
    Version     : 1.0.0
    Date        : April 24, 2026
    License     : MIT
#>

$winget = Get-Command winget -ErrorAction SilentlyContinue
if (-not $winget) {
    Write-Host "winget was not found on this system."
    pause
    exit 1
}

Clear-Host
Write-Host "============================================"
Write-Host "   Update Winget"
Write-Host "============================================"
Write-Host "Refreshing sources..."
winget source update

Write-Host ""
Write-Host "Checking available upgrades..."
winget upgrade

Write-Host ""
$confirm = Read-Host "Type YES to upgrade all packages"
if ($confirm -ne "YES") {
    Write-Host "Cancelled."
    pause
    exit 0
}

Write-Host ""
Write-Host "Starting package upgrades..."
winget upgrade --all --accept-package-agreements --accept-source-agreements

Write-Host ""
Write-Host "Done."
pause
