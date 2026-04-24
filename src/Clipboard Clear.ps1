<# 
    Script Name : Clipboard Clear.ps1
    Description : Clears the current clipboard contents.
    Author      : kardelitaitu
    Version     : 1.0.0
    Date        : April 24, 2026
    License     : MIT
#>

$confirm = Read-Host "Type YES to clear the clipboard"
if ($confirm -ne "YES") {
    Write-Host "Cancelled."
    pause
    exit 0
}

Set-Clipboard -Value ""
Write-Host "Clipboard cleared."
pause
