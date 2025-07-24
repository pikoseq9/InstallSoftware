# InstallSoftware.ps1

A PowerShell script for automated installation of common applications using [WinGet](https://learn.microsoft.com/en-us/windows/package-manager/winget/).

##  What does this script do?

- Installs a predefined list of applications automatically.
- Skips applications that are already installed.
- Displays messages for successful installations, missing packages, or errors.
- Handles errors and continues with the next application.

##  Requirements

- Windows 10 1809+ (21H1+) or 11 with PowerShell.
- [WinGet](https://learn.microsoft.com/en-us/windows/package-manager/winget/) installed (the script attempts to install it if missing).
- Administrator privileges (recommended to run PowerShell as administrator).

##  How to Run

1. Download or clone the repository.
2. Open **PowerShell as Administrator**.
3. Navigate to the folder containing `InstallSoftware.ps1`.
4. Run:

```powershell
.\InstallSoftware.ps1
