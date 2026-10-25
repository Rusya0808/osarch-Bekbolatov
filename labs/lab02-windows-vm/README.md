\# Lab 2 - Windows guest and networking



Pair: Bekbolatov   Driver first half: Bekbolatov

Machine: Host OS Windows 11, Guests Ubuntu 24.04 and Windows 11

Date: 25.10.2026



\## What I did

1\. Installed Windows 11 Enterprise evaluation VM.

2\. Configured Bridged Networking for both VMs to place them on the same physical subnet as the host router.

3\. Allowed ICMP echo requests through the Windows firewall using `wf.msc` instead of disabling the firewall completely.

4\. Tested memory overcommitment by assigning 18GB total RAM to VMs on a 16GB host.



\## Result

Network Diagram:

(Internet) --- \[Router 192.168.1.1] ---+--- (Host Laptop)

&#x20;                                      |

&#x20;                                      +--- (Ubuntu VM enp0s3: 192.168.1.41)

&#x20;                                      |

&#x20;                                      +--- (Windows VM Ethernet: 192.168.1.143)



Both VMs can successfully ping each other and access the internet. During the memory experiment, the host system became unresponsive and heavily utilized the paging file.



\## What did not work the first time

The initial ping from Linux to Windows failed because the Windows Defender Firewall blocks incoming ICMP echo requests by default on Public/Private profiles. I fixed this by enabling the specific "File and Printer Sharing (Echo Request - ICMPv4-In)" rule rather than disabling the firewall.



\## Evidence

\- \[evidence/ipconfig-windows.txt](evidence/ipconfig-windows.txt) - confirms Windows IP configuration.

\- \[evidence/ip-addr-linux.txt](evidence/ip-addr-linux.txt) - confirms Linux IP configuration.

\- \[evidence/ping-both-ways.txt](evidence/ping-both-ways.txt) - proves two-way connectivity after firewall fix.

\- \[evidence/host-memory-before.png](evidence/host-memory-before.png) - host memory baseline.

\- \[evidence/host-memory-after.png](evidence/host-memory-after.png) - host memory during overcommitment.

