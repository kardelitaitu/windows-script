<# 
    Script Name : Explorer Restart.ps1
    Description : Restarts Windows Explorer.
    Author      : kardelitaitu
    Version     : 1.0.0
    Date        : April 24, 2026
    License     : MIT
#>

Get-Process explorer -ErrorAction SilentlyContinue | Stop-Process -Force
Start-Process explorer.exe
Write-Host "Explorer restarted."
exit 0
