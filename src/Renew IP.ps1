<# 
    Script Name : Renew IP.ps1
    Description : Renews the local IP address lease.
    Author      : kardelitaitu
    Version     : 1.0.0
    Date        : April 24, 2026
    License     : MIT
#>

$confirm = Read-Host "Type YES to renew the IP address"
if ($confirm -ne "YES") {
    Write-Host "Cancelled."
    pause
    exit 0
}

ipconfig /release
ipconfig /renew
Write-Host "IP address renewed."
pause
