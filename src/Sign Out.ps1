<# 
    Script Name : Sign Out.ps1
    Description : Signs out the current Windows session.
    Author      : kardelitaitu
    Version     : 1.0.0
    Date        : April 24, 2026
    License     : MIT
#>

$confirm = Read-Host "Type YES to sign out"
if ($confirm -ne "YES") {
    Write-Host "Cancelled."
    pause
    exit 0
}

shutdown.exe /l
exit 0
