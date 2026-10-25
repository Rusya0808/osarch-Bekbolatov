\# Lab 0 - Inventory your own machine



Pair: Bekbolatov   Driver first half: Bekbolatov

Machine: Host OS Windows 11 (ваша модель ноутбука)

Date: 26.10.2026



\## What I did

I used Windows PowerShell/CMD to collect hardware specifications (CPU, memory, disk, firmware, and virtualization status) without opening any graphical user interfaces like Task Manager or System Information.



\## Result



| What | Value | Where I got it (Command) |

| :--- | :--- | :--- |

| \*\*CPU\*\* model, core count, thread count | (Например: Intel Core i5-1135G7, 4 cores, 8 threads) | `(ваша команда, например: Get-CimInstance Win32\_Processor)` |

| \*\*Memory\*\* total, module count, speed | (Например: 16 GB, 2 modules, 3200 MHz) | `(ваша команда, например: Get-CimInstance Win32\_PhysicalMemory)` |

| \*\*Disk\*\* model, type, free space | (Например: NVMe Samsung 512GB, 120GB free) | `(ваша команда, например: Get-Volume)` |

| \*\*Firmware\*\* type, version, date | (Например: UEFI, Insyde v1.05, 2023-01-15) | `(ваша команда, например: msinfo32 или wmic bios get)` |

| \*\*Virtualization\*\* enabled? | (Например: Yes) | `(ваша команда, например: systeminfo)` |



\## What did not work the first time

(Здесь нужно описать одну проблему. Например: Сначала я посмотрел общий объем диска, а по заданию нужно было найти именно свободное место на томе. Мне пришлось искать другую команду, чтобы получить правильное значение.)



\## Evidence

\- \[evidence/cpu.txt](evidence/cpu.txt) - CPU details and core counts.

\- \[evidence/memory.txt](evidence/memory.txt) - RAM total, layout and speed.

\- \[evidence/disk.txt](evidence/disk.txt) - Disk type and free space on the volume.

