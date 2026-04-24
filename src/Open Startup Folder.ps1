<# 
    Script Name : Open Startup Folder.ps1
    Description : Opens the current user's Startup folder.
    Author      : kardelitaitu
    Version     : 1.0.0
    Date        : April 24, 2026
    License     : MIT
#>

Start-Process explorer.exe "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
