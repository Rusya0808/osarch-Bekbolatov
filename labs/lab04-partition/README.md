# Lab 4 — Storage

## Windows
Disk 0: partition style GPT, firmware_type UEFI — because Windows booted in UEFI mode from the primary disk.
New disk: partition style GPT — because it is standard, supports large sizes and modern firmware.

```powershell
Get-Disk

Number Friendly Name Serial Number         OperationalStatus Health Status Partition Style Total Size Partition Offset
------ ------------- -------------         ----------------- ------------ --------------- ---------- ----------------
0      VBOX HARDDISK                       Online            Healthy      GPT                25.00 GB                1024 B
1      VBOX HARDDISK                       Online            Healthy      GPT                 2.00 GB                1024 B

Get-Partition -DiskNumber 1

   DiskPath             PartitionNumber  DriveLetter Offset                        Size Type
   --------             ---------------  ------------ ------                        ---- ----
   \\?\SCSI#Disk...     1                E            1048576                   1.99 GB Basic Data
Linux layout — beforePlaintextNAME                      SIZE TYPE FSTYPE      MOUNTPOINT
sda                        25G disk
├─sda1                      1M part
├─sda2                      2G part ext4        /boot
└─sda3                     23G part LVM2_member
  └─ubuntu--vg-ubuntu--lv  11G lvm  ext4        /
sdb                         2G disk
sdc                         2G disk
sdd                         2G disk
Linux layout — after the rebuildPlaintextNAME                      SIZE TYPE FSTYPE      MOUNTPOINT
sda                        25G disk
├─sda1                      1M part
├─sda2                      2G part ext4        /boot
└─sda3                     23G part LVM2_member
  └─ubuntu--vg-ubuntu--lv  11G lvm  ext4        /
sdb                         2G disk
├─sdb1                     2G part raid
  └─md0                    4G raid5 ext4        /mnt/mirror
sdc                         2G disk
├─sdc1                     2G part raid
  └─md0                    4G raid5 ext4        /mnt/mirror
sdd                         2G disk
├─sdd1                     2G part raid
  └─md0                    4G raid5 ext4        /mnt/mirror
RoleDeviceMirror half Asdb1Failed halfsdc1Replacementsdd1The questionYour colleague deleted the wrong file from the mirror an hour ago. Does RAID 1 help? Why?No, RAID 1 does not help in this scenario because a mirror instantly replicates every write operation, including file deletions, across all active disks. If a file is intentionally or accidentally deleted from the filesystem, it is removed from every copy in the array simultaneously. Regular backups or snapshotting are required to recover from logical user errors of this nature.
