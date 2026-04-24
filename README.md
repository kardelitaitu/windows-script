# Windows Scripts Helper

A curated collection of useful Windows helper scripts (`.ps1`, `.bat`, `.cmd`, etc.).  
This repository is designed to make it easy to run and access custom scripts directly from the Windows Start Menu.

---

## ✨ Features
- Centralized collection of Windows automation and helper scripts.
- Automatic shortcut creation for all scripts in the repo.
- Shortcuts are named after the script (without extension).
- Supports PowerShell (`.ps1`), Batch (`.bat`), and CMD (`.cmd`) scripts.
- Shortcuts are placed in:
  
```bash
C:\ProgramData\Microsoft\Windows\Start Menu
```

## 📂 Repository Structure
```
windows-script/
├── src/
│   ├── Sleep Timer.ps1
│   ├── another-tool.bat
│   ├── example script A.cmd
│   ├── example script B.cmd
│   └── ...
├── create-shortcuts.bat
├── README.md
└── LICENSE
```

---

## 🚀 Usage
1. Clone this repository:
   
```bash
git clone https://github.com/kardelitaitu/windows-script
```

2. Navigate into the repo:

```bash
cd windows-script
```
    
3. Run create-shortcuts.bat as Administrator.

4. Shortcuts will be created in the Start Menu.


License
This project is licensed under the MIT License.
You are free to use, modify, and distribute these scripts with attribution.


Author
Created by kardelitaitu  
Version: 1.0.0  
Date: April 24, 2026
