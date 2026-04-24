<# 
    Script Name : RawAccel.ps1
    Description : Launches the Raw Accel GUI if it is installed.
    Author      : kardelitaitu
    Version     : 1.0.0
    Date        : April 24, 2026
    License     : MIT
#>

$candidates = @(
    "$env:ProgramFiles\RawAccel\rawaccel.exe",
    "$env:ProgramFiles(x86)\RawAccel\rawaccel.exe",
    "$env:LOCALAPPDATA\Programs\RawAccel\rawaccel.exe"
)

$exe = $candidates | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $exe) {
    Write-Host "RawAccel was not found."
    pause
    exit 1
}

Start-Process -FilePath $exe
exit 0
