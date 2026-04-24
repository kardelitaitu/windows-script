<# 
    Script Name : Lock.ps1
    Description : Locks the current Windows session.
    Author      : kardelitaitu
    Version     : 1.0.0
    Date        : April 24, 2026
    License     : MIT
#>

rundll32.exe user32.dll,LockWorkStation
