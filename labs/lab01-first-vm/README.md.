# Lab 1 - Your first virtual machine

**Pair:** Bekbolatov  
**Driver first half:** Bekbolatov  
**Machine:** Host Windows 11, Guest Ubuntu Server  
**Date:** 27.10.2026

## What I did

1. Created a VM and installed Ubuntu Server.
2. Allocated resources based on host machine specs.
3. Took a snapshot named `clean-install` before making changes.
4. Intentionally broke the system by deleting `/etc/hostname` and modifying network configurations to cause a failure.
5. Rolled back to the `clean-install` snapshot and confirmed the damage was gone.

## Result

**Resource Allocation Justification:**
I allocated 2 vCPUs, 2 GB of RAM, and 25 GB of disk space for the Ubuntu Server guest. My host machine has an AMD Ryzen 7 with 8 Cores, 16 GB of RAM, and 180 GB of free NVMe storage. This allocation is justified because Ubuntu Server without a GUI is very lightweight. It leaves 6 cores and 14 GB of RAM for my Windows 11 host to remain fully responsive, while taking only a small fraction of my available disk space.

## What did not work the first time

During the Ubuntu Server installation, navigating the installer without a mouse was unusual at first, leading to a slight delay in selecting the correct network configuration. Using the Tab and Space keys resolved the issue.

## Evidence

- [evidence/vm-settings.png](evidence/vm-settings.png) — CPU, memory, and disk settings as configured
- [evidence/guest-release.txt](evidence/guest-release.txt) — output of lsb_release -a inside the guest
- [evidence/broken.png](evidence/broken.png) — the guest in its broken state
- [evidence/snapshot-list.png](evidence/snapshot-list.png) — snapshots, after the rollback
