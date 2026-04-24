<# 
    Script Name : Flush DNS.ps1
    Description : Flushes the local DNS cache and clears resolver state.
    Author      : kardelitaitu
    Version     : 1.0.0
    Date        : April 24, 2026
    License     : MIT
#>

$user = [Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
$isAdmin = $user.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Host "Please run this script as Administrator."
    pause
    exit 1
}

Write-Host "Flushing DNS cache..."
ipconfig /flushdns
pause
