
---

### ⚡ `create-shortcuts.bat`

This batch file scans the `scripts` folder and creates shortcuts in the Start Menu.

```bat
@echo off
setlocal enabledelayedexpansion

:: Target Start Menu folder
set "startMenu=C:\ProgramData\Microsoft\Windows\Start Menu"

:: Source scripts folder
set "scripts=%~dp0scripts"

echo Creating shortcuts for scripts in %scripts% ...
echo Shortcuts will be placed in %startMenu%

:: Loop through all supported extensions
for %%f in ("%scripts%\*.ps1" "%scripts%\*.bat" "%scripts%\*.cmd") do (
    if exist "%%f" (
        set "file=%%~nxf"
        set "name=%%~nf"
        set "target=%%f"
        set "shortcut=%startMenu%\!name!.lnk"

        echo Creating shortcut: !shortcut!

        :: Use PowerShell to create the shortcut
        powershell -NoLogo -NoProfile -Command ^
            "$ws = New-Object -ComObject WScript.Shell; ^
             $s = $ws.CreateShortcut('!shortcut!'); ^
             $s.TargetPath = '!target!'; ^
             $s.WorkingDirectory = '%scripts%'; ^
             $s.Save()"
    )
)

echo Done.
pause
