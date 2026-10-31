\# Ticket 1: VM build document



\## 1. The Request

"The new developer starts Monday and needs a test machine. Please create a VM and write a guide so the office manager can do it next time."



\## 2. The Real Need

The office manager (Aigerim) lacks technical expertise. A simple list of settings is not enough. The real need is a highly visual, step-by-step runbook written in plain language that explains \*why\* certain settings (like NAT or Snapshots) are chosen. Additionally, the VM must be isolated but have internet access, and a rollback point must be created.



\## 3. What Was Done

\* Created a Linux (Ubuntu) virtual machine in VirtualBox.

\* Configured non-default settings (Snapshot taken for quick rollback, NAT chosen for network isolation).

\* Wrote `BUILD.md` tailored specifically for a non-technical reader, explaining the rationale behind OS choice, resource limits, network type, and backups.

\* Collected all required diagnostic outputs and screenshots.



\## 4. Resource Allocation

\* \*\*Host Machine:\*\* ASUS TUF Gaming A15 FA506NCR.

\* \*\*Allocation:\*\* 2048 MB RAM and 25 GB Disk Space.

\* \*\*Calculation/Reasoning:\*\* The host has ample resources (typically 16GB RAM and 512GB+ SSD). Allocating 2GB RAM and 25GB storage is the optimal sweet spot for a CLI-based Linux test environment — it provides enough overhead for development tasks without causing any memory pressure or storage starvation on the host operating system.



\## 5. Evidence

All collected evidence is located in the `evidence/` directory:

\* \[01-new-vm-wizard.png](evidence/01-new-vm-wizard.png)

\* \[02-disk-settings.png](evidence/02-disk-settings.png)

\* \[03-network-adapter.png](evidence/03-network-adapter.png)

\* \[04-guest-uname.txt](evidence/04-guest-uname.txt)

\* \[05-ping-between-guests.txt](evidence/05-ping-between-guests.txt)

\* \[06-snapshot-list.png](evidence/06-snapshot-list.png)



\## 6. Problems and Resolutions

\*\*Issue:\*\* After switching the network adapter from Bridged to NAT to meet the isolation requirement, I could no longer connect to the VM via SSH from the host Windows machine to easily pipe the `uname -a` output into a file. 

\*\*Resolution:\*\* Since NAT completely hides the VM behind a virtual router, SSH access from the host requires manual port forwarding. To save time and keep the configuration simple, I executed the commands directly in the VM console, then recreated the output text file locally on the Windows host using PowerShell's `Set-Content`. In the future, if SSH is strictly required, I will configure port forwarding rules in the VirtualBox NAT settings.

