# AGENTS.md for `C:\My Script\windows-script`

## Codebase map

- `src\Sleep Timer.ps1` is the interactive sleep timer.
- `src\Shutdown Timer.ps1` is the interactive shutdown timer.
- `create-shortcut.bat` scans `src\` and creates Start Menu shortcuts.
- `icon.png` is the source image asset.
- `icon.ico` is the Windows shortcut icon asset.
- `README.md` is the user-facing setup and usage doc.

## How it works

- Shortcuts are named from the script filename.
- `.ps1` shortcuts must launch `powershell.exe -File ...`; direct `.ps1` targets may open in an editor instead of running.
- The batch file overwrites same-name shortcuts by deleting the old `.lnk` first.
- The shortcut icon comes from `icon.ico` in the repo root.
- The current default target is the per-user Start Menu `Programs` folder.

## Repository rules

- Keep names consistent between script file, shortcut name, and README.
- Keep changes small and focused.
- Prefer reliable Windows-native behavior over clever shortcuts.
- Update docs whenever file names or launch behavior change.
- Use simple, durable patterns so the repo stays easy to extend.

## Editing guidance

- When adding a new tool script, place it in `src\`.
- If you add a new `.ps1`, make sure the batch launcher still runs it through PowerShell.
- If you change the icon, regenerate `icon.ico` from the root PNG source.
- If you change the shortcut destination, update both `create-shortcut.bat` and `README.md`.

## Response style

- Use short, logical explanations.
- Recommend the best next move for maintainability.
- When comparing options, include a pros and cons table.
- Mention alternatives when they are useful.
