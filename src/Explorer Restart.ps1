<# 
    Script Name : Explorer Restart.ps1
    Description : Restarts Windows Explorer.
    Author      : kardelitaitu
    Version     : 1.0.0
    Date        : April 24, 2026
    License     : MIT
#>

$confirm = Read-Host "Type YES to restart Explorer"
if ($confirm -ne "YES") {
    Write-Host "Cancelled."
    pause
    exit 0
}

Get-Process explorer -ErrorAction SilentlyContinue | Stop-Process -Force
Start-Process explorer.exe
Write-Host "Explorer restarted."
exit 0
