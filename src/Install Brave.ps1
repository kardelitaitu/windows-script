<# 
    Script Name : Install Brave.ps1
    Description : Installs Brave Browser with winget.
    Author      : kardelitaitu
    Version     : 1.0.0
    Date        : April 24, 2026
    License     : MIT
#>

$packages = @(
    @{ Name = "Brave Browser"; Id = "Brave.Brave" }
)

$winget = Get-Command winget -ErrorAction SilentlyContinue
if (-not $winget) {
    Write-Host "winget was not found on this system."
    pause
    exit 1
}

Clear-Host
Write-Host "============================================"
Write-Host "   Install Brave"
Write-Host "============================================"
foreach ($package in $packages) {
    Write-Host " - $($package.Name) [$($package.Id)]"
}
Write-Host ""
Write-Host "Future additions could include:"
Write-Host " - Firefox"
Write-Host " - Vivaldi"
Write-Host " - Opera"
Write-Host ""

$confirm = Read-Host "Type YES to install Brave Browser"
if ($confirm -ne "YES") {
    Write-Host "Cancelled."
    pause
    exit 0
}

winget install -e --id Brave.Brave --accept-package-agreements --accept-source-agreements
Write-Host ""
Write-Host "Done."
pause
