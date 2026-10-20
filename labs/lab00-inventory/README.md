# Lab 00 - Inventory your own machine

**Pair:** Bekbolatov  
**Driver first half:** Bekbolatov  
**Machine:** Host Windows 11  
**Date:** 20.10.2026  

## What I did

Ran CLI commands in PowerShell to gather hardware information without using GUI tools.

```powershell
Get-CimInstance Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors
Get-CimInstance Win32_PhysicalMemory | Select-Object Capacity, Speed, DeviceLocator
Get-Volume | Select-Object DriveLetter, FileSystemLabel, SizeRemaining, Size
Get-CimInstance Win32_BIOS | Select-Object SMBIOSBIOSVersion, ReleaseDate
Get-CimInstance Win32_Processor | Select-Object VirtualizationFirmwareEnabled
What,Value,Where I got it
"CPU Model, Cores, Threads","AMD Ryzen 7 7435HS, 8 Cores, 16 Threads",Get-CimInstance Win32_Processor
"Total RAM, Modules, Speed","16 GB, 2 modules (2x8GB), 4800 MHz",Get-CimInstance Win32_PhysicalMemory
"Disk Model, Type, Free Space","NVMe SSD 512GB, Free: 180 GB","Get-CimInstance Win32_DiskDrive, Get-Volume"
"Firmware Type, Version, Date","UEFI, FA506NCR.304, 08.01.2025",Get-CimInstance Win32_BIOS
Hardware Virtualization Enabled,True,Get-CimInstance Win32_Processor

