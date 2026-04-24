<p align="center">
  <img src="https://img.shields.io/badge/Windows-Scripts-0078D4?style=for-the-badge&logo=windows&logoColor=white" alt="Windows Scripts Helper badge">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/PowerShell-Automation-5391FE?style=flat-square&logo=powershell&logoColor=white" alt="PowerShell automation badge">
  <img src="https://img.shields.io/badge/winget-Install%20Profiles-1F9D55?style=flat-square" alt="winget install profiles badge">
  <img src="https://img.shields.io/badge/Windows-Utilities-0078D4?style=flat-square&logo=windows&logoColor=white" alt="Windows utilities badge">
  <img src="https://img.shields.io/badge/Start%20Menu-Shortcuts-FFB000?style=flat-square" alt="Start Menu shortcuts badge">
  <img src="https://img.shields.io/badge/CLI-Friendly-2F855A?style=flat-square" alt="CLI friendly badge">
  <img src="https://img.shields.io/badge/Curated-Tool%20Profiles-6B46C1?style=flat-square" alt="curated tool profiles badge">
</p>

<p align="center">
  <strong>Windows Script</strong>
</p>

<p align="center">
  A curated set of Windows utilities, shortcut automation, and winget profiles for fast, repeatable setup.
</p>

---

## Why this exists

This repo keeps practical Windows actions in one place:

- system shortcuts
- cleanup helpers
- network tools
- timer actions
- curated app installers

The goal is simple: make a Windows machine easier to set up and easier to use.

## Highlights

- Generates Start Menu shortcuts automatically
- Uses a consistent `src`-based layout
- Supports one-shot utilities and confirmation-based cleanup scripts
- Includes curated `winget` install profiles for common PC use-cases
- Keeps shortcut names readable and consistent with the script names

## Layout

```text
windows-script/
├── .gitignore
├── AGENTS.md
├── create-shortcut.bat
├── icon.ico
├── README.md
└── LICENSE
└── src/
    ├── Clean Recent Files.ps1
    ├── Clean Temp.ps1
    ├── Clipboard Clear.ps1
    ├── Control Panel.ps1
    ├── Empty Recycle Bin.ps1
    ├── Explorer Restart.ps1
    ├── Flush DNS.ps1
    ├── GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}/
    │   └── .gitkeep
    ├── Hibernate Timer.ps1
    ├── Install Benchmark.ps1
    ├── Install Brave.ps1
    ├── Install Chrome.ps1
    ├── Install Developer.ps1
    ├── Install Gaming.ps1
    ├── Install Media.ps1
    ├── Install Productivity.ps1
    ├── Install Repair.ps1
    ├── Lock.ps1
    ├── Network Reset.ps1
    ├── Open Startup Folder.ps1
    ├── Package Cleanup.ps1
    ├── Ping Google.ps1
    ├── Public IP.ps1
    ├── RawAccel.ps1
    ├── Renew IP.ps1
    ├── Restart Timer.ps1
    ├── Shutdown Timer.ps1
    ├── Sign Out.ps1
    ├── Sleep Now.ps1
    ├── Sleep Timer.ps1
    └── Update Winget.ps1
```

## Script Index

### System and session

| # | Name | Description |
|---|---|---|
| 1 | `Sleep Timer.ps1` | Delays sleep for a chosen amount of time. |
| 2 | `Shutdown Timer.ps1` | Delays system shutdown for a chosen amount of time. |
| 3 | `Restart Timer.ps1` | Delays system restart for a chosen amount of time. |
| 4 | `Hibernate Timer.ps1` | Delays hibernation for a chosen amount of time. |
| 5 | `Lock.ps1` | Locks the current Windows session. |
| 10 | `Open Startup Folder.ps1` | Opens the current user's Startup folder. |
| 11 | `Explorer Restart.ps1` | Restarts Windows Explorer immediately. |
| 16 | `Control Panel.ps1` | Opens the classic Windows Control Panel. |
| 17 | `GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}` | Opens the classic Windows GodMode Control Panel view. |
| 19 | `Sleep Now.ps1` | Puts the computer to sleep immediately. |
| 20 | `Sign Out.ps1` | Signs out the current Windows session after confirmation. |

### Cleanup and network

| # | Name | Description |
|---|---|---|
| 6 | `Flush DNS.ps1` | Flushes the local DNS cache. |
| 7 | `Network Reset.ps1` | Offers common network repair actions. |
| 8 | `Clean Temp.ps1` | Previews and removes safe temporary files after confirmation. |
| 9 | `Empty Recycle Bin.ps1` | Shows recycle bin item count and size, then empties it after confirmation. |
| 12 | `Clipboard Clear.ps1` | Clears the clipboard after confirmation. |
| 13 | `Clean Recent Files.ps1` | Previews and removes recent file shortcuts after confirmation. |
| 15 | `Renew IP.ps1` | Renews the local IP address lease after confirmation. |
| 18 | `Package Cleanup.ps1` | Previews and removes safe package-related cache files after confirmation. |
| 21 | `Ping Google.ps1` | Pings Google DNS to check basic network connectivity and pauses afterward. |
| 22 | `Public IP.ps1` | Shows the current public IP address and pauses afterward. |

### Install profiles

| # | Name | Description |
|---|---|---|
| 23 | `Install Benchmark.ps1` | Installs the benchmark profile: HWiNFO, CPU-Z, GPU-Z, and CrystalDiskMark. |
| 24 | `Install Chrome.ps1` | Installs Google Chrome with winget. |
| 25 | `Install Brave.ps1` | Installs Brave Browser with winget. |
| 26 | `Install Developer.ps1` | Installs a curated developer toolset including Python 3 via winget. |
| 27 | `Install Media.ps1` | Installs VLC, HandBrake, and FFmpeg. |
| 28 | `Install Productivity.ps1` | Installs PowerToys, 7-Zip, Notepad++, Obsidian, LibreOffice, and CopyQ. |
| 29 | `Install Gaming.ps1` | Installs Steam, PowerToys, Afterburner, and optionally RawAccel from the official GitHub release. |
| 30 | `Install Repair.ps1` | Installs Everything and Sysinternals troubleshooting tools. |
| 31 | `RawAccel.ps1` | Launches the Raw Accel GUI if it is installed. |

### Launcher and automation

| # | Name | Description |
|---|---|---|
| 32 | `create-shortcut.bat` | Creates Start Menu shortcuts for scripts in `src`. |

## Quick Start

1. Clone the repo.

```bash
git clone https://github.com/kardelitaitu/windows-script
cd windows-script
```

2. Run `create-shortcut.bat`.

3. Open the Start Menu and use the generated shortcuts.

## Notes

- Shortcuts are created in the current user's Start Menu programs folder:

```text
C:\Users\username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs
```

- Script names become shortcut names automatically.
- PowerShell scripts are launched through `powershell.exe` so they run instead of opening in an editor.
- `Update Winget` is marked to run as administrator.
- Add new scripts to `src` and rerun the batch file.

## Roadmap

- Add more helper scripts
- Add a safer install/uninstall flow
- Add validation for shortcut generation
- Add profile-specific installer notes

## Future Additions

### Benchmark

- `3DMark`
- `AIDA64 Extreme`
- `OCCT`
- `Geekbench`

### Browser

- `Microsoft Edge`
- `Firefox`
- `Opera`

### Repair

- `Rufus`
- `Microsoft Sysinternals PsExec`
- `Microsoft Sysinternals DiskView`
- `Microsoft Sysinternals Autologon`

### Productivity

- `Everything`
- `Ditto`
- `Microsoft Power BI Desktop`

### Media

- `Audacity`
- `Icaros`
- `Shotcut`
- `VidCoder`

### Gaming

- `RawAccel` is handled as an optional add-on inside `Install Gaming.ps1`

## License

MIT

## Author

Created by `kardelitaitu`

## Icon Credit

Icon author: [kiranshastry](https://www.flaticon.com/authors/kiranshastry)

<p align="center">
  <a href="https://github.com/kardelitaitu/windows-script">
    <img src="https://img.shields.io/github/stars/kardelitaitu/windows-script?style=social" alt="GitHub stars">
  </a>
  <a href="https://github.com/kardelitaitu/windows-script">
    <img src="https://img.shields.io/github/forks/kardelitaitu/windows-script?style=social" alt="GitHub forks">
  </a>
  <a href="https://github.com/kardelitaitu">
    <img src="https://img.shields.io/badge/GitHub-kardelitaitu-181717?style=social&logo=github" alt="GitHub profile">
  </a>
</p>

<p align="center"><strong>Contact</strong></p>

<p align="center">
  <a href="https://x.com/adikara55">
    <img src="https://img.shields.io/badge/X-@adikara55-000000?style=social&logo=x" alt="X profile">
  </a>
  <a href="https://t.me/adikara55">
    <img src="https://img.shields.io/badge/Telegram-@adikara55-26A5E4?style=social&logo=telegram" alt="Telegram profile">
  </a>
  <a href="https://discord.gg/xS3yH5KGwq">
    <img src="https://img.shields.io/badge/Discord-Join%20Server-5865F2?style=social&logo=discord" alt="Discord invite">
  </a>
</p>
