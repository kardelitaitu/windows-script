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
│   └── Restart Timer.ps1
│   └── Hibernate Timer.ps1
│   └── Lock.ps1
│   └── Flush DNS.ps1
│   └── Network Reset.ps1
│   └── Clean Temp.ps1
│   └── Empty Recycle Bin.ps1
│   └── Open Startup Folder.ps1
│   └── Explorer Restart.ps1
│   └── Clipboard Clear.ps1
│   └── Clean Recent Files.ps1
│   └── Update Winget.ps1
│   └── Renew IP.ps1
│   └── Control Panel.ps1
├── create-shortcut.bat
├── README.md
└── LICENSE
```

## Scripts

| # | Name | Description |
|---|---|---|
| 1 | `Sleep Timer.ps1` | Delays sleep for a chosen amount of time. |
| 2 | `Shutdown Timer.ps1` | Delays system shutdown for a chosen amount of time. |
| 3 | `Restart Timer.ps1` | Delays system restart for a chosen amount of time. |
| 4 | `Hibernate Timer.ps1` | Delays hibernation for a chosen amount of time. |
| 5 | `Lock.ps1` | Locks the current Windows session. |
| 6 | `Flush DNS.ps1` | Flushes the local DNS cache. |
| 7 | `Network Reset.ps1` | Offers common network repair actions. |
| 8 | `Clean Temp.ps1` | Previews and removes safe temporary files after confirmation. |
| 9 | `Empty Recycle Bin.ps1` | Shows recycle bin item count and size, then empties it after confirmation. |
| 10 | `Open Startup Folder.ps1` | Opens the current user's Startup folder. |
| 11 | `Explorer Restart.ps1` | Restarts Windows Explorer immediately. |
| 12 | `Clipboard Clear.ps1` | Clears the clipboard after confirmation. |
| 13 | `Clean Recent Files.ps1` | Previews and removes recent file shortcuts after confirmation. |
| 14 | `Update Winget.ps1` | Refreshes winget sources and upgrades all packages after confirmation. |
| 15 | `Renew IP.ps1` | Renews the local IP address lease after confirmation. |
| 16 | `Control Panel.ps1` | Opens the classic Windows Control Panel. |
| 17 | `GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}` | Opens the classic Windows GodMode Control Panel view. |
| 18 | `Package Cleanup.ps1` | Previews and removes safe package-related cache files after confirmation. |
| 19 | `Sleep Now.ps1` | Puts the computer to sleep immediately. |
| 20 | `Sign Out.ps1` | Signs out the current Windows session after confirmation. |
| 21 | `Ping Google.ps1` | Pings Google DNS to check basic network connectivity and pauses afterward. |
| 22 | `Public IP.ps1` | Shows the current public IP address and pauses afterward. |
| 23 | `Install Benchmark.ps1` | Installs the benchmark profile: HWiNFO, CPU-Z, GPU-Z, and CrystalDiskMark. |
| 24 | `Install Chrome.ps1` | Installs Google Chrome with winget. |
| 25 | `Install Brave.ps1` | Installs Brave Browser with winget. |
| 26 | `Install Developer.ps1` | Installs a curated developer toolset including Python 3 via winget. |
| 27 | `Install Media.ps1` | Installs VLC, HandBrake, and FFmpeg. |
| 28 | `Install Productivity.ps1` | Installs PowerToys, 7-Zip, Notepad++, Obsidian, LibreOffice, and CopyQ. |
| 29 | `Install Gaming.ps1` | Installs Steam, PowerToys, Afterburner, and optionally RawAccel from the official GitHub release. |
| 30 | `Install Repair.ps1` | Installs Everything and Sysinternals troubleshooting tools. |
| 31 | `RawAccel.ps1` | Launches the Raw Accel GUI if it is installed. |
| 32 | `create-shortcut.bat` | Creates Start Menu shortcuts for scripts in `src`. |

### Future Benchmark Additions

- `3DMark`
- `AIDA64 Extreme`
- `OCCT`
- `Geekbench`

### Future Browser Additions

- `Microsoft Edge`
- `Firefox`
- `Opera`

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

## Icon Credit

Icon author: [kiranshastry](https://www.flaticon.com/authors/kiranshastry)
