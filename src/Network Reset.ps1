<# 
    Script Name : Network Reset.ps1
    Description : Opens a small menu for common network repair commands.
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

Clear-Host
Write-Host "============================================"
Write-Host "   Network Reset"
Write-Host "============================================"
Write-Host " [1] Flush DNS"
Write-Host " [2] Reset Winsock"
Write-Host " [3] Reset IP stack"
Write-Host " [0] Exit"
Write-Host "============================================"

$choice = Read-Host "Enter your choice (0-3)"

switch ($choice) {
    "1" { ipconfig /flushdns }
    "2" { netsh winsock reset }
    "3" { netsh int ip reset }
    default { Write-Host "Exit or invalid choice." }
}

pause
