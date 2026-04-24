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
│   └── sleepTimer.ps1
├── create-shortcut.bat
├── README.md
└── LICENSE
```

## Files

- `src/sleepTimer.ps1` - interactive sleep timer for Windows
- `create-shortcut.bat` - creates Start Menu shortcuts for scripts in `src`

## Usage

1. Clone the repo.

```bash
git clone https://github.com/kardelitaitu/windows-script
cd windows-script
```

2. Run `create-shortcut.bat` as Administrator.

3. Start Menu shortcuts will be created for every supported script in `src`.

## Notes

- Shortcuts are created in `C:\ProgramData\Microsoft\Windows\Start Menu`
- Script names become shortcut names automatically
- Add new scripts to `src` and rerun the batch file

## Roadmap

- Add more helper scripts
- Add a safer install/uninstall flow
- Add validation for shortcut generation

## License

MIT

## Author

Created by `kardelitaitu`
