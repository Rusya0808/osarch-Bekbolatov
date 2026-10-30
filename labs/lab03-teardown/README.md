My machine is an ASUS TUF Gaming A15 FA506NCR. Since ASUS does not provide a public service manual, I used a teardown video from YouTube for the exploded view and hardware limits, as permitted by the lab brief.

\### 2. Components



\*\*1. Battery\*\*

\- \*\*What:\*\* 48Wh rechargeable Li-ion battery.

\- \*\*Connects to:\*\* The system board via an internal power connector.

\- \*\*Limits:\*\* 48Wh capacity limits unplugged runtime.



\*\*2. Memory\*\*

\- \*\*What:\*\* SO-DIMM slots (located under the black protective shield).

\- \*\*Connects to:\*\* The CPU's memory controller on the system board.

\- \*\*Limits:\*\* DDR4 SO-DIMM, up to 32 GB total.



\*\*3. Cooling System \& CPU\*\*

\- \*\*What:\*\* Dual fans and copper heat pipes covering the CPU and GPU.

\- \*\*Connects to:\*\* CPU/GPU package (soldered to board) and fan power headers.

\- \*\*Limits:\*\* The CPU is soldered (BGA) and cannot be replaced or upgraded.



\*\*4. Storage (Empty Bay / Secondary Slot)\*\*

\- \*\*What:\*\* 2.5-inch SATA drive bay or secondary M.2 slot area.

\- \*\*Connects to:\*\* SATA connector or M.2 slot on the system board.

\- \*\*Limits:\*\* Constrained by the physical size (2.5" or 2280) and interface speed.



\### 3. The Upgrade Verdict



| Component | Upgradeable? | Notes |

| :--- | :--- | :--- |

| Memory | Yes | Two SO-DIMM slots are accessible under the protective shield. |

| Drive | Yes | There is an accessible slot/bay for storage expansion. |

| CPU | No | The CPU is soldered directly to the motherboard (BGA). |



\### 4. The same machine from the command line



| Specification | Windows (Host) | Linux (Ubuntu VM) |

| :--- | :--- | :--- |

| Logical CPUs | 16 | 1 |

| Total memory | 16 GB | 1.6 GiB |

| Disk interface | NVMe | sata |

