<# 
    Script Name : Public IP.ps1
    Description : Shows the current public IP address.
    Author      : kardelitaitu
    Version     : 1.0.0
    Date        : April 24, 2026
    License     : MIT
#>

try {
    $ip = Invoke-RestMethod -Uri "https://api.ipify.org?format=json" -UseBasicParsing
    Write-Host "Public IP: $($ip.ip)"
} catch {
    Write-Host "Unable to fetch public IP."
}
pause
