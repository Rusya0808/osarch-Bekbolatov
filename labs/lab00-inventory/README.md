# Lab 00 - Inventory your own machine
Pair: Bekbolatov 
Driver first half: Bekbolatov
Machine: Host Windows 11
Date: 20.10.2026
## What I did
Ran CLI commands in PowerShell to gather hardware information without using GUI tools.
```powershell
Get-CimInstance Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors
Get-CimInstance Win32_PhysicalMemory | Select-Object Capacity, Speed, DeviceLocator
Get-Volume | Select-Object DriveLetter, FileSystemLabel, SizeRemaining, Size
Get-CimInstance Win32_BIOS | Select-Object SMBIOSBIOSVersion, ReleaseDate
Get-CimInstance Win32_Processor | Select-Object VirtualizationFirmwareEnabled
