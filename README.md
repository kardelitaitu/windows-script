# Windows Scripts Helper

<p align="center">
  <img src="https://img.shields.io/badge/Windows-Scripts%20Helper-0078D4?style=for-the-badge&logo=windows&logoColor=white" alt="Windows Scripts Helper badge">
</p>

<p align="center">
  A small Windows automation repo for reusable scripts and Start Menu shortcuts.
</p>

---

## What this repo does

- Keeps utility scripts in one place
- Generates Start Menu shortcuts automatically
- Supports PowerShell, Batch, and CMD scripts
- Keeps the setup simple and easy to extend

## Current layout

```text
windows-script/
├── src/
│   └── Sleep Timer.ps1
│   └── Shutdown Timer.ps1
├── create-shortcut.bat
├── README.md
└── LICENSE
```

## Files

- `src/Sleep Timer.ps1` - interactive sleep timer for Windows
- `src/Shutdown Timer.ps1` - interactive shutdown timer for Windows
- `create-shortcut.bat` - creates Start Menu shortcuts for scripts in `src`

## Usage

1. Clone the repo.

```bash
git clone https://github.com/kardelitaitu/windows-script
cd windows-script
```

2. Run `create-shortcut.bat`

3. Start Menu shortcuts will be created for every supported script in `src`.

## Notes

- Shortcuts are created in the current user's Start Menu programs folder
```
C:\Users\username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs
```
- Script names become shortcut names automatically
- PowerShell scripts are launched through `powershell.exe` so they run instead of opening in an editor
- Add new scripts to `src` and rerun the batch file

## Roadmap

- Add more helper scripts
- Add a safer install/uninstall flow
- Add validation for shortcut generation

## License

MIT

## Author

Created by `kardelitaitu`
