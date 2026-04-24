
<# 
    Script Name : Install Gaming.ps1
    Description : Installs a curated gaming toolset with winget and optionally installs Raw Accel.
    Author      : kardelitaitu
    Version     : 1.0.0
    Date        : April 24, 2026
    License     : MIT
#>

$packages = @(
    @{ Name = "Steam"; Id = "Valve.Steam" },
    @{ Name = "PowerToys"; Id = "Microsoft.PowerToys" },
    @{ Name = "Afterburner"; Id = "Guru3D.Afterburner" }
)

$rawAccelZipUrl = "https://github.com/RawAccelOfficial/rawaccel/releases/download/v1.7.1/RawAccel_v1.7.1.zip"
$rawAccelPrereqs = @(
    @{ Name = "Visual C++ 2015-2022 Redistributable (x64)"; Id = "Microsoft.VCRedist.2015+.x64" },
    @{ Name = "Visual C++ 2015-2022 Redistributable (x86)"; Id = "Microsoft.VCRedist.2015+.x86" },
    @{ Name = ".NET Framework Developer Pack 4"; Id = "Microsoft.DotNet.Framework.DeveloperPack_4" }
)

$winget = Get-Command winget -ErrorAction SilentlyContinue
if (-not $winget) {
    Write-Host "winget was not found on this system."
    pause
    exit 1
}

Clear-Host
Write-Host "============================================"
Write-Host "   Install Gaming"
Write-Host "============================================"
Write-Host "This profile installs:"
Write-Host ""
foreach ($package in $packages) {
    Write-Host " - $($package.Name) [$($package.Id)]"
}
Write-Host ""
Write-Host "Optional add-on:"
Write-Host " - RawAccel (official GitHub release)"
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
$installRawAccel = Read-Host "Type YES to download and install RawAccel too"
if ($installRawAccel -eq "YES") {
    Write-Host ""
    Write-Host "Installing RawAccel prerequisites..."
    foreach ($package in $rawAccelPrereqs) {
        Write-Host " - $($package.Name)"
        winget install -e --id $package.Id --accept-package-agreements --accept-source-agreements
    }

    $tempRoot = Join-Path $env:TEMP "RawAccel"
    $zipPath = Join-Path $tempRoot "RawAccel_v1.7.1.zip"
    $extractPath = Join-Path $tempRoot "RawAccel_v1.7.1"

    New-Item -ItemType Directory -Path $tempRoot -Force | Out-Null
    Write-Host "Downloading RawAccel..."
    Invoke-WebRequest -Uri $rawAccelZipUrl -OutFile $zipPath

    if (Test-Path $extractPath) {
        Remove-Item -LiteralPath $extractPath -Recurse -Force -ErrorAction SilentlyContinue
    }

    Write-Host "Extracting RawAccel..."
    Expand-Archive -LiteralPath $zipPath -DestinationPath $extractPath -Force

    $installer = Get-ChildItem -LiteralPath $extractPath -Recurse -Filter installer.exe -ErrorAction SilentlyContinue | Select-Object -First 1
    if (-not $installer) {
        Write-Host "installer.exe was not found in the RawAccel archive."
        pause
        exit 1
    }

    Write-Host "Installing RawAccel driver..."
    Start-Process -FilePath $installer.FullName -Verb RunAs -Wait
    Write-Host "RawAccel installation finished. Restart your computer for the driver to take effect."
} else {
    Write-Host "RawAccel skipped."
}

Write-Host ""
Write-Host "Done."
pause
