Task 2: Ubuntu (2 vCPU, 2048 MB, 20 GB dynamic, NAT + SSH 127.0.0.1:2222->22) and Win11 (4 vCPU, 4096 MB, 50 GB dynamic, NAT) fit host (16 threads, 15.82 GB RAM / 8.46 GB free, 137.65 GB free).
## Allocation

| Parameter | Guest 1: Ubuntu Server | Guest 2: Windows 11 |
| **vCPUs** | 2 vCPUs | 4 vCPUs |
| **Memory (RAM)** | 2,048 MB (2 GB) | 4,096 MB (4 GB) |
| **Disk size** | 20 GB | 50 GB |
| **Disk allocation type** | Dynamically allocated (VDI/VMDK) | Dynamically allocated (VDI/VMDK) |
| **Network adapter(s) & mode** | 1 adapter: **NAT** with Port Forwarding rule (`Host 127.0.0.1:2222 -> Guest 22`) | 1 adapter: **NAT** |

## Arithmetic

* **Host baseline assumption:** To keep the Windows 11 Pro host responsive (UI, browser, background services, hypervisor overhead), I reserve **4 logical processors (2 cores)**, **6 GB RAM** (note: currently 8.46 GB of 15.82 GB is free before launching VMs), and **30 GB free disk space** for pagefile/hibernation/OS operations.
* **CPU:**
  * Available on host: **16 logical processors** (8 cores)
  * Allocated to guests: $2 + 4 = 6\text{ vCPUs}$
  * Remaining for host: $16 - 6 = 10\text{ logical processors}$ (well above the 4-thread host baseline).
* **Memory:**
  * Available on host: **15.82 GB total** (~8.46 GB currently free)
  * Allocated to guests: $2\text{ GB} + 4\text{ GB} = 6\text{ GB}$
  * Remaining for host: $15.82 - 6 = 9.82\text{ GB}$ total (~$8.46 - 6 = 2.46\text{ GB}$ immediate free buffer without closing host apps; closing heavy browser tabs frees additional RAM).
* **Storage (System NVMe SSD):**
  * Available free space on `C:`: **137.65 GB**
  * Maximum provisioned (dynamic): $20\text{ GB} + 50\text{ GB} = 70\text{ GB}$ (actual initial disk footprint ~18–22 GB)
  * Remaining free space (worst-case full expansion): $137.65 - 70 = 67.65\text{ GB}$ (well above the 30 GB safety margin).

## Justification

* **CPU & RAM sizing:** Ubuntu Server runs headless without a GUI, so 2 vCPUs and 2 GB RAM are sufficient for SSH and network services. Windows 11 requires a minimum of 2 vCPUs and 4 GB RAM by official specification; allocating 4 vCPUs prevents UI lag while keeping 10 threads for the host.
* **Dynamically allocated disks:** Our host has 137.65 GB free on a single 476.94 GB NVMe SSD. Dynamic disks consume only the actually written blocks (~3 GB for Ubuntu, ~15 GB for Windows 11 initially) rather than locking 70 GB immediately, while capping maximum growth at 70 GB so the host disk cannot fill up.
* **Network mode (NAT + Port Forwarding vs. Bridged / Host-Only):**
  * **NAT** gives both guests outbound internet access through the host's active Wi-Fi/Ethernet connection without requiring extra IP addresses on the office LAN or failing when switching networks (unlike **Bridged** mode, which can be blocked by corporate MAC filtering or Wi-Fi AP isolation).
  * **Port forwarding (`127.0.0.1:2222 -> 22`)** on Ubuntu's NAT adapter allows the host to reach the Ubuntu guest over SSH securely via loopback while keeping internet access on a single NIC, avoiding the complexity of configuring a second **Host-Only** adapter.

## Verification plan

| Target | Command to run | Expected output |
|---|---|---|
| **Ubuntu Guest** (CPU, RAM, Disk) | `nproc && free -h && df -h /` | `2` (vCPUs), `Mem: 1.9Gi` total, `/` filesystem size `~20G`. |
| **Ubuntu Guest** (Internet access) | `curl -I -s https://archive.ubuntu.com \| head -n 1` | `HTTP/1.1 200 OK` (confirms DNS resolution and outbound NAT internet access). |
| **Host (PowerShell)** (SSH to Ubuntu) | `ssh -p 2222 ubuntu@127.0.0.1 "hostname && whoami"` | Connects without timeout and prints the Ubuntu guest hostname and username. |
| **Windows 11 Guest** (CPU & RAM) | `systeminfo \| findstr /B /C:"OS Name" /C:"Total Physical Memory"` and `echo %NUMBER_OF_PROCESSORS%` | `OS Name: Microsoft Windows 11...`, `Total Physical Memory: 4,096 MB`, processor count `4`. |
| **Windows 11 Guest** (Disk & Internet) | `Get-Volume C \| Select-Object Size` and `Test-NetConnection 1.1.1.1 -Port 443` | Disk size `~50 GB` and `TcpTestSucceeded : True`. |