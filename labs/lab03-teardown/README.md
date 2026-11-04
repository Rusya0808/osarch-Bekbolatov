# Lab 3: Teardown without a screwdriver

### 1. The Machine
My machine is an ASUS TUF Gaming A15 FA506NCR. Since ASUS does not provide a public service manual, I used a teardown video from YouTube for the exploded view and hardware limits, as permitted by the lab brief.

### 2. Components

*(Insert your annotated teardown screenshot here)*
![Exploded View](evidence/manual-figures/exploded-view.jpg)

**1. Battery**
- **What:** 48Wh rechargeable Li-ion battery.
- **Connects to:** The system board via an internal power connector.
- **Limits:** 48Wh capacity limits unplugged runtime.

**2. Memory**
- **What:** SO-DIMM slots (located under the black protective shield).
- **Connects to:** The CPU's memory controller on the system board.
- **Limits:** DDR5 SO-DIMM, up to 32 GB total.

**3. Cooling System & CPU**
- **What:** Dual fans and copper heat pipes covering the CPU and GPU.
- **Connects to:** CPU/GPU package (soldered to board) and fan power headers.
- **Limits:** The CPU is soldered (BGA) and cannot be replaced or upgraded.

**4. Storage (Empty Bay / Secondary Slot)**
- **What:** 2.5-inch SATA drive bay or secondary M.2 slot area.
- **Connects to:** SATA connector or M.2 slot on the system board.
- **Limits:** Constrained by the physical size (2.5" or 2280) and interface speed.

### 3. The Upgrade Verdict

| Component | Manual/Video says | OS says | Verdict |
| :--- | :--- | :--- | :--- |
| **Memory** | 2x SO-DIMM slots, up to 32 GB | 2 devices, FormFactor: 12 (SODIMM) | **Partly:** Two slots available. OS reports 64GB max, video says 32GB. |
| **Storage** | M.2 2280 NVMe slots | BusType: NVMe, MediaType: SSD | **Yes:** M.2 2280 NVMe drives are supported. |
| **CPU** | Soldered to board (BGA) | SocketDesignation: FP7r2 | **No:** CPU is soldered directly to the motherboard. |

*Note on disagreement: The Windows OS might report a different maximum memory capacity (like 64 GB) while the manufacturer specs state 32 GB. The OS reads the SMBIOS firmware table, which vendors often fill out incorrectly. Therefore, I trust the manufacturer's limits.*

### 4. The same machine from the command line

| Fact | Windows (Host) | Linux (Ubuntu VM) |
| :--- | :--- | :--- |
| **CPU model** | `Win32_Processor` Name = AMD Ryzen 7 7435HS | `lscpu` Model name = AMD Ryzen 7 7435HS |
| **Physical cores** | `Win32_Processor` NumberOfCores = 8 | `lscpu` Core(s) per socket = 1 |
| **Logical CPUs** | `Win32_Processor` NumberOfLogicalProcessors = 16 | `lscpu` CPU(s) = 1 |
| **Total memory** | `Win32_ComputerSystem` TotalPhysicalMemory = 16989732864 | `free -h` total = 1.6Gi |
| **Memory type/speed** | `Win32_PhysicalMemory` SMBIOSMemoryType = 34 (DDR5), Speed = 5600 | `dmidecode -t memory` Type = DRAM (VM) |
| **Disk type** | `Get-PhysicalDisk` MediaType = SSD | `lsblk` ROTA = 1 (Virtual HDD) |
| **Disk interface** | `Get-PhysicalDisk` BusType = NVMe | `lsblk` TRAN = sata (in VM) |
| **Motherboard** | `Win32_BaseBoard` Product = FA506NCR | `dmidecode -t baseboard` Product Name = VirtualBox |

*Comparison analysis: The values differ significantly because Linux is running inside a virtual machine. The VM reports virtualized hardware (like 1 CPU core, limited RAM allocated, with a SATA virtual disk), whereas Windows reads the actual physical hardware of the ASUS host.*