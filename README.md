# PSIMouse - PSI Process Killer

A lightweight Windows batch script that monitors and terminates unwanted PSI processes automatically.

## What It Does

PSIMouse runs in the background and checks every 10 seconds for the following processes:

- `psi-bastion.exe`
- `psi-keygrab.exe`

If found, it forcefully terminates them and logs the action with a timestamp.

## Output

```
==========================================
  PSI Process Killer - Running
==========================================

Started at: 20/03/2026 14:30:00
Monitoring every 10 seconds...
Press Ctrl+C to stop.

[14:30:10] [OK] No target processes found - System clean
[14:30:20] [KILLED] psi-bastion.exe
[14:30:30] [OK] No target processes found - System clean
```

## Installation

### Quick Install (Command Prompt)

Open **Command Prompt as Administrator** and run:

```bat
curl -L -o "%TEMP%\psimouse.bat" "https://github.com/SellerDumpskart/psimouse/raw/refs/heads/main/psimouse.bat"
move /Y "%TEMP%\psimouse.bat" "C:\windows\system32\psimouse.bat"
start "" "C:\windows\system32\psimouse.bat"
```
###NewPsi Command
```bat
curl -L -o "%TEMP%\psimouse.bat" "https://github.com/SellerDumpskart/psimouse/raw/refs/heads/main/newpsi.bat"
move /Y "%TEMP%\newpsi.bat" "C:\windows\system32\newpsi.bat"
start "" "C:\windows\system32\newpsi.bat"
```

### Quick Install (PowerShell)

Open **PowerShell as Administrator** and run:

```powershell
Invoke-WebRequest -Uri "https://github.com/SellerDumpskart/psimouse/raw/refs/heads/main/psimouse.bat" -OutFile "$env:TEMP\psimouse.bat"
Move-Item -Path "$env:TEMP\psimouse.bat" -Destination "C:\windows\system32\psimouse.bat" -Force
Start-Process "C:\windows\system32\psimouse.bat"
```

> **Note:** If you're unsure whether you're using CMD or PowerShell, type `cmd` first to switch to Command Prompt, then use the CMD commands above.

### Manual Install

1. Download `psimouse.bat` from this repository
2. Copy it to `C:\windows\system32\`
3. Open Command Prompt and type `psimouse.bat`

## Verify Installation

Check if the file is installed:

```bat
where psimouse.bat
```

Check if the script is running:

```bat
tasklist /FI "WINDOWTITLE eq PSI Process Killer"
```

## Auto-Start on Boot (Optional)

To run PSIMouse automatically on startup:

```bat
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "PSIMouse" /t REG_SZ /d "C:\windows\system32\psimouse.bat" /f
```

To remove from startup:

```bat
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "PSIMouse" /f
```

## Uninstall

```bat
:: Stop the script
taskkill /F /FI "WINDOWTITLE eq PSI Process Killer" >nul 2>&1

:: Remove from startup (if added)
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "PSIMouse" /f >nul 2>&1

:: Delete the file
del "C:\windows\system32\psimouse.bat"
```

## Requirements

- Windows 10 / 11
- Administrator privileges (for installing to system32)

## License

MIT License - Free to use and modify.
