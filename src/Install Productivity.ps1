
<# 
    Script Name : Install Productivity.ps1
    Description : Installs a curated productivity toolset with winget.
    Author      : kardelitaitu
    Version     : 1.0.0
    Date        : April 24, 2026
    License     : MIT
#>

$packages = @(
    @{ Name = "PowerToys"; Id = "Microsoft.PowerToys" },
    @{ Name = "7-Zip"; Id = "7zip.7zip" },
    @{ Name = "Notepad++"; Id = "Notepad++.Notepad++" },
    @{ Name = "Obsidian"; Id = "Obsidian.Obsidian" },
    @{ Name = "LibreOffice"; Id = "TheDocumentFoundation.LibreOffice" },
    @{ Name = "CopyQ"; Id = "hluk.CopyQ" }
)

$winget = Get-Command winget -ErrorAction SilentlyContinue
if (-not $winget) {
    Write-Host "winget was not found on this system."
    pause
    exit 1
}

Clear-Host
Write-Host "============================================"
Write-Host "   Install Productivity"
Write-Host "============================================"
Write-Host "This profile installs:"
Write-Host ""
foreach ($package in $packages) {
    Write-Host " - $($package.Name) [$($package.Id)]"
}
Write-Host ""
Write-Host "Future additions could include:"
Write-Host " - Everything"
Write-Host " - Ditto"
Write-Host " - Microsoft Power BI Desktop"
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
Write-Host "Done."
pause
