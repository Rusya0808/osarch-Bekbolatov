\# Test Virtual Machine Build Guide



Hi Aigerim! This step-by-step guide will help you prepare a virtual machine (VM) for our new developers. Just follow the screenshots and instructions below.



\## Step 1: Creating the VM

Click the \*\*"New"\*\* button (blue icon) in the main VirtualBox window. 

Enter a name (e.g., `Ubuntu-Test`), select \*\*Linux\*\* as the Type, and \*\*Ubuntu (64-bit)\*\* as the Version.

> \*\*Why we chose this:\*\* Ubuntu is a stable and standard operating system that most of our developers use for their daily tasks.



!\[Step 1 - Creation](evidence/01-new-vm-wizard.png)



\## Step 2: Allocating Resources (Memory and Disk)

Set the Base Memory (RAM) slider to \*\*2048 MB\*\* (2 GB) and the Hard Disk size to \*\*25 GB\*\*.

> \*\*Why we chose this:\*\* This amount of resources is perfectly sufficient for the developer's test environment, and it ensures that your main computer will not slow down while the VM is running.



!\[Step 2 - Resources](evidence/02-disk-settings.png)



\## Step 3: Network Configuration

Go to \*\*Settings -> Network\*\* and set the "Attached to" option to \*\*NAT\*\*.

> \*\*Why we chose this:\*\* NAT acts as a security barrier. It gives the virtual machine internet access so the developer can download necessary files, but it prevents outside network access to the VM, keeping our network secure.



!\[Step 3 - Network](evidence/03-network-adapter.png)



\## Step 4: System and Internet Verification

After launching the system, we verify that it is installed correctly and has network access.

\* The file \[04-guest-uname.txt](evidence/04-guest-uname.txt) records the kernel version of the installed system.

\* The file \[05-ping-between-guests.txt](evidence/05-ping-between-guests.txt) proves that the internet connection is working (packets successfully reach Google servers without loss).



\## Step 5: Creating a Restore Point (Snapshot)

In the VM menu, select \*\*Snapshots\*\* and click \*\*Take\*\*. Name it something clear, like `Clean setup for Dev`.

> \*\*Why we chose this:\*\* Developers often break the system during experiments. This snapshot works like a "save game" — if something goes wrong, we can instantly roll back the machine to this clean, working state without having to reinstall everything from scratch.



!\[Step 5 - Snapshot](evidence/06-snapshot-list.png)

