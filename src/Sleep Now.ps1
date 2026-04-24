<# 
    Script Name : Sleep Now.ps1
    Description : Puts the computer to sleep immediately.
    Author      : kardelitaitu
    Version     : 1.0.0
    Date        : April 24, 2026
    License     : MIT
#>

rundll32.exe powrprof.dll,SetSuspendState 0,1,0
exit 0
