
<# 
    Script Name : Install Developer.ps1
    Description : Installs a curated developer toolset with winget.
    Author      : kardelitaitu
    Version     : 1.0.0
    Date        : April 24, 2026
    License     : MIT
#>

$packages = @(
    @{ Name = "Git"; Id = "Git.Git" },
    @{ Name = "Visual Studio Code"; Id = "Microsoft.VisualStudioCode" },
    @{ Name = "7-Zip"; Id = "7zip.7zip" },
    @{ Name = "GitHub Desktop"; Id = "GitHub.GitHubDesktop" },
    @{ Name = "PowerToys"; Id = "Microsoft.PowerToys" },
    @{ Name = "Node.js"; Id = "OpenJS.NodeJS" }
)

$pythonPackageId = "Python.Python.3"

$winget = Get-Command winget -ErrorAction SilentlyContinue
if (-not $winget) {
    Write-Host "winget was not found on this system."
    pause
    exit 1
}

Clear-Host
Write-Host "============================================"
Write-Host "   Install Developer"
Write-Host "============================================"
Write-Host "This profile installs:"
Write-Host ""
foreach ($package in $packages) {
    Write-Host " - $($package.Name) [$($package.Id)]"
}

Write-Host " - Python [$pythonPackageId]"
Write-Host ""
Write-Host "Future additions could include:"
Write-Host " - Postman"
Write-Host " - Docker Desktop"
Write-Host " - Microsoft Sysinternals tools"
Write-Host " - GitHub CLI"
Write-Host ""

$confirm = Read-Host "Type YES to install these packages"
if ($confirm -ne "YES") {
    Write-Host "Cancelled."
    pause
    exit 0
}

foreach ($package in $packages) {
    Write-Host ""
    Write-Host "Installing $($package.Name)..."
    winget install -e --id $package.Id --accept-package-agreements --accept-source-agreements
}

Write-Host ""
Write-Host "Installing Python..."
winget install -e --id $pythonPackageId --accept-package-agreements --accept-source-agreements

Write-Host ""
Write-Host "Done."
pause
