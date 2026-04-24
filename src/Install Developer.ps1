
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

$winget = Get-Command winget -ErrorAction SilentlyContinue
if (-not $winget) {
    Write-Host "winget was not found on this system."
    pause
    exit 1
}

function Get-LatestPythonStableId {
    $search = & winget search --id Python.Python 2>$null
    if (-not $search) { return $null }

    $matches = foreach ($line in $search) {
        if ($line -match '^(Python 3)\s+(Python\.Python\.3\.\d+)\s+([0-9]+\.[0-9]+(\.[0-9]+)?)\s+winget$') {
            [pscustomobject]@{
                Name    = $matches[1]
                Id      = $matches[2]
                Version = [version]$matches[3]
            }
        }
    }

    $stable = $matches | Sort-Object Version -Descending | Select-Object -First 1
    if ($stable) { return $stable.Id }
    return $null
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

$pythonId = Get-LatestPythonStableId
Write-Host " - Python [$pythonId]"
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

if ($pythonId) {
    Write-Host ""
    Write-Host "Installing Python..."
    winget install -e --id $pythonId --accept-package-agreements --accept-source-agreements
} else {
    Write-Host ""
    Write-Host "Python package ID could not be resolved."
}

Write-Host ""
Write-Host "Done."
pause
