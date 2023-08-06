# WSL-configuration
Personal Windows Subsystem for Linux installation for development

## Requirements

- Windows 11, or Windows 10 version 1903 or higher
- WSL feature

## Enable WSL feature

1. Enable WSL feature using the following command:

```powershell
DISM /Online /Enable-Feature /FeatureName:VirtualMachinePlatform /All /NoRestart
DISM /Online /Enable-Feature /FeatureName:Microsoft-Windows-Subsystem-Linux /All /NoRestart
```

2. Restart PC to apply changes, you can use the following PowerShell command:

```powershell
Restart-Computer
```

## Install Linux distribution

1. Install Ubuntu using the following command:

```powershell
wsl.exe --install Ubuntu
```

2. Wait for the installation, after installation you will see the message "Please create a default UNIX user account.", input a username and a password.

3. Then run `install.bat` as Administrator to install packages.