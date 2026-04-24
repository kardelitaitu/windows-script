
<# 
    Script Name : Install Repair.ps1
    Description : Installs a curated repair and troubleshooting toolset with winget.
    Author      : kardelitaitu
    Version     : 1.0.0
    Date        : April 24, 2026
    License     : MIT
#>

$packages = @(
    @{ Name = "Everything"; Id = "voidtools.Everything" },
    @{ Name = "Process Explorer"; Id = "Microsoft.Sysinternals.ProcessExplorer" },
    @{ Name = "Autoruns"; Id = "Microsoft.Sysinternals.Autoruns" },
    @{ Name = "Process Monitor"; Id = "Microsoft.Sysinternals.ProcessMonitor" },
    @{ Name = "TCPView"; Id = "Microsoft.Sysinternals.TCPView" },
    @{ Name = "ZoomIt"; Id = "Microsoft.Sysinternals.ZoomIt" }
)

$winget = Get-Command winget -ErrorAction SilentlyContinue
if (-not $winget) {
    Write-Host "winget was not found on this system."
    pause
    exit 1
}

Clear-Host
Write-Host "============================================"
Write-Host "   Install Repair"
Write-Host "============================================"
Write-Host "This profile installs:"
Write-Host ""
foreach ($package in $packages) {
    Write-Host " - $($package.Name) [$($package.Id)]"
}
Write-Host ""
Write-Host "Future additions could include:"
Write-Host " - Rufus"
Write-Host " - Microsoft Sysinternals PsExec"
Write-Host " - Microsoft Sysinternals DiskView"
Write-Host " - Microsoft Sysinternals Autologon"
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
