\# Lab 1 - Your first virtual machine



Pair: Bekbolatov / (ФамилияНапарника)   Driver first half: Bekbolatov

Machine: Host OS Windows 11, Guest Ubuntu Server 24.04

Date: 26.10.2026



\## What I did

1\. Installed Ubuntu Server (no GUI) from an ISO image.

2\. Allocated resources based on my host machine's capacity. 

&#x20;  \*\*Justification:\*\* I allocated 2 vCPUs and 4 GB of RAM. My host has 16 GB of RAM total, and Windows uses about 6 GB idle, so 4 GB leaves enough room for the host and a second VM later. My host CPU has 8 threads, so 2 vCPUs is a safe allocation.

3\. Created a snapshot named `clean-install`.

4\. Intentionally broke the guest OS by deleting `/etc/hostname` and verified it was broken.

5\. Rolled back to the `clean-install` snapshot and confirmed the system was working again.



\## Result

The virtual machine was successfully created, broken, and restored. Resource limits were set properly without overloading the host.



\## What did not work the first time

(Например: I initially forgot to take the snapshot before breaking the system, so I had to reinstall the OS and try again to properly document the rollback process.)



\## Evidence

\- \[evidence/vm-settings.png](evidence/vm-settings.png) - CPU, memory, disk as configured.

\- \[evidence/guest-release.txt](evidence/guest-release.txt) - output of `lsb\_release -a` inside the guest.

\- \[evidence/broken.png](evidence/broken.png) - the guest in its broken state (missing hostname).

\- \[evidence/snapshot-list.png](evidence/snapshot-list.png) - snapshots, after the rollback.

