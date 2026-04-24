@echo off
setlocal EnableExtensions EnableDelayedExpansion

rem Create Start Menu shortcuts for scripts in the repo's src folder.
set "startMenu=%ProgramData%\Microsoft\Windows\Start Menu"
set "scripts=%~dp0src"

if not exist "%scripts%" (
    echo Source folder not found: "%scripts%"
    exit /b 1
)

echo Creating shortcuts from "%scripts%"
echo Target folder: "%startMenu%"

for %%F in ("%scripts%\*.ps1" "%scripts%\*.bat" "%scripts%\*.cmd") do (
    if exist "%%~fF" (
        set "name=%%~nF"
        set "target=%%~fF"
        set "shortcut=%startMenu%\!name!.lnk"

        echo Creating shortcut: !shortcut!
        powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command ^
            "$ws = New-Object -ComObject WScript.Shell; " ^
            "$s = $ws.CreateShortcut('!shortcut!'); " ^
            "$s.TargetPath = '!target!'; " ^
            "$s.WorkingDirectory = '%scripts%'; " ^
            "$s.Save()"
    )
)

echo Done.
pause
