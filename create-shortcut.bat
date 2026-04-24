@echo off
setlocal EnableExtensions EnableDelayedExpansion

rem Create Start Menu shortcuts for scripts in the repo's src folder.
set "startMenu=%AppData%\Microsoft\Windows\Start Menu\Programs"
set "scripts=%~dp0src"
set "iconPath=%~dp0icon.ico"
set "psExe=%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe"
if not exist "%scripts%" (
    echo Source folder not found: "%scripts%"
    exit /b 1
)

echo Creating shortcuts from "%scripts%"
echo Target folder: "%startMenu%"
echo Icon file: "%iconPath%"

for %%F in ("%scripts%\*.ps1" "%scripts%\*.bat" "%scripts%\*.cmd") do (
    if exist "%%~fF" (
        set "name=%%~nF"
        set "target=%%~fF"
        set "isPs1=0"
        if /I "%%~xF"==".ps1" set "isPs1=1"
        set "shortcut=%startMenu%\!name!.lnk"

        echo Creating shortcut: !shortcut!
        if exist "!shortcut!" del /f /q "!shortcut!"
        powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command ^
            "$ws = New-Object -ComObject WScript.Shell; " ^
            "$s = $ws.CreateShortcut('!shortcut!'); " ^
            "if ('!isPs1!' -eq '1') { " ^
            "  $s.TargetPath = '%psExe%'; " ^
            "  $s.Arguments = '-NoProfile -ExecutionPolicy Bypass -File \"!target!\"'; " ^
            "} else { " ^
            "  $s.TargetPath = '!target!'; " ^
            "} " ^
            "$s.WorkingDirectory = '%scripts%'; " ^
            "$s.IconLocation = '%iconPath%,0'; " ^
            "$s.Save()"

        if /I "!name!"=="Update Winget" (
            powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command ^
                "$bytes = [System.IO.File]::ReadAllBytes('!shortcut!'); " ^
                "$bytes[0x15] = $bytes[0x15] -bor 0x20; " ^
                "[System.IO.File]::WriteAllBytes('!shortcut!', $bytes)"
        )
    )
)

echo Done.
explorer.exe "%startMenu%"
exit /b 0
