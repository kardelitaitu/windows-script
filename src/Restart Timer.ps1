<#
    Script Name : Restart Timer.ps1
    Description : Interactive restart timer utility for Windows system.
                  Allows user to select preset delays (2, 5, 10, 30 minutes)
                  or enter custom minutes. Validates input ranges to prevent
                  invalid values. Logs countdown progress every 100 seconds.
    Author      : kardelitaitu
    Version     : 1.0.0
    Date        : April 24, 2026
    License     : MIT
#>

Clear-Host
Write-Host "============================================"
Write-Host "   Restart Timer - Choose Delay"
Write-Host "============================================"
Write-Host " [1] Restart in 2 minutes"
Write-Host " [2] Restart in 5 minutes"
Write-Host " [3] Restart in 10 minutes"
Write-Host " [4] Restart in 30 minutes"
Write-Host " [5] Custom (enter your own minutes)"
Write-Host " [0] Exit"
Write-Host "============================================"

while ($true) {
    $choice = Read-Host "Enter your choice (0-5)"
    $seconds = $null

    switch ($choice) {
        "0" { break }
        "1" { $seconds = 120 }
        "2" { $seconds = 300 }
        "3" { $seconds = 600 }
        "4" { $seconds = 1800 }
        "5" {
            while ($true) {
                $minutes = Read-Host "Enter number of minutes (1-1666)"
                if ([int]::TryParse($minutes, [ref]$null)) {
                    $minutes = [int]$minutes
                    if ($minutes -ge 1 -and $minutes -le 1666) {
                        $seconds = $minutes * 60
                        break
                    } else {
                        Write-Host "Invalid! Must be between 1 and 1666 minutes (~27h 46m)."
                    }
                } else {
                    Write-Host "Please enter a valid number."
                }
            }
        }
        default {
            Write-Host "Invalid choice, try again."
            continue
        }
    }

    if ($choice -eq "0") { break }

    if ($seconds -ne $null) {
        Write-Host "Starting countdown: $seconds seconds (~$($seconds/60) minutes)"
        Write-Host "============================================"

        # Log progress every 100 seconds
        for ($i = $seconds; $i -gt 0; $i -= 100) {
            if ($i -ge 100) {
                Start-Sleep -Seconds 100
                Write-Host "Remaining: $($i-100) seconds"
            } else {
                Start-Sleep -Seconds $i
                Write-Host "Remaining: 0 seconds"
            }
        }

        # Trigger real restart
        shutdown.exe /r /t 0
        break
    }
}
