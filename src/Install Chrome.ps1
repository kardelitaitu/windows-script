<# 
    Script Name : Install Chrome.ps1
    Description : Installs Google Chrome with winget.
    Author      : kardelitaitu
    Version     : 1.0.0
    Date        : April 24, 2026
    License     : MIT
#>

$packages = @(
    @{ Name = "Google Chrome"; Id = "Google.Chrome" }
)

$winget = Get-Command winget -ErrorAction SilentlyContinue
if (-not $winget) {
    Write-Host "winget was not found on this system."
    pause
    exit 1
}

Clear-Host
Write-Host "============================================"
Write-Host "   Install Chrome"
Write-Host "============================================"
foreach ($package in $packages) {
    Write-Host " - $($package.Name) [$($package.Id)]"
}
Write-Host ""
Write-Host "Future additions could include:"
Write-Host " - Microsoft Edge"
Write-Host " - Firefox"
Write-Host " - Opera"
Write-Host ""

$confirm = Read-Host "Type YES to install Google Chrome"
if ($confirm -ne "YES") {
    Write-Host "Cancelled."
    pause
    exit 0
}

winget install -e --id Google.Chrome --accept-package-agreements --accept-source-agreements
Write-Host ""
Write-Host "Done."
pause
