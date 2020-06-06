# intel-i9-10900K-Asus-prime-Z490A-hackintosh
### Firstly sorry my english not so good :)

![Asus Prime Z490-A i9-10900K Hackintosh MacOS installation](https://github.com/yilmazca/intel-i9-10900K-Asus-prime-Z490A-hackintosh/blob/master/Docs/ss1.png?raw=true)


Hello everyone,

I successfully installed the system on Macos (hackintosh) 10.15.5 and it is working correctly.

**Please use my EFI folder in this repository.**

I hope that will be useful :)


## Current Bootlader
**Opencore 0.5.9**

## Hardware
* Asus Prime Z490-A
* Intel i9-10900K
* 16GB DDR4 3000MHZ
* SanDisk Extreme Pro 1TB M.2 NVMe 3D SSD
* Intel UHD Graphics 630 (Primary)
* Intel® I225-V 2.5Gb Ethernet
* Tp-Link 3468 1Gbit Pcie Card
* Realtek ALC S1220A
* Creative Sound Blaster Audigy PCIe RX 7.1
* SMBIOS: iMac19,2

## What's Working ?
- [x] Intel UHD Graphics 630 (iGPU), Working correctly with **Metal Support** on DP (Display Port)
- [x] Onboard Audio Realtek ALC S1220A (if you have different motherboard, you may need to change layout-id)
- [x] SanDisk Extreme Pro 1TB M.2 NVMe 3D SSD, Test results below
- [x] Intel® I225-V 2.5Gb Ethernet (Working with FakePCIID_Intel_I225-V.kext)
- [x] Tp-Link 3468 [Working with correctly](https://github.com/Mieze/RTL8111_driver_for_OS_X/releases/tag/v2.2.2) - (This repository Have'nt this kext)
- [x] Creative Sound Blaster Audigy PCIe (Working with kXAudioDriver.kext)
- [x] Sleep/Wake
- [x] Reboot and Shutdown

## Not Working
- [ ] HDMI Port not working.

What solutions did I try for HDMI Port?
* Framebuffer Patching with BusID with/without WhateverGreen.kext. 
> If you have an idea, please let me know.

## Onboard Audio, HDMI Audio
I needed the list to run the audio.
* AppleALC.kext
* FakeID.kext
* FakePCIID_Intel_HDMI_Audio.kext
* device-id=709D0000
* layout-id=15000000 

I am using HDMI audio on DisplayPort(DP) with LG 34WK650

## USB Ports
I used hackintool for USB Port Map. You will see screenshot below. If you are using another ASUS model motherboard, USB Ports may not working correctly. 
In similar cases, 
1. Enable USBInjectAll.kext
2. Disable USBPorts.kext
3. Disable SSDT-UIAC.aml
4. Enable XhciPortLimit frm KERNEL tab.
5. Reboot (Now you have all USB Ports,you can't use it that way. You should not exceed the 15 port limit. This is absolutely essential for system stability.)
6. Open Hackintool app and REMAP according to you. Check this link for details [The New Beginner's Guide to USB Port Configuration](https://www.tonymacx86.com/threads/the-new-beginners-guide-to-usb-port-configuration.286553/)

# Installation
**Bios Settings**
* Disable
    * Fast Boot
    * CSM
    * Thunderbolt
    * Intel SGX
    * CFG Lock (This motherboard directly closed "Bios version 0403")
* Enable
    * VT-x
    * 4G Decoding
    * Hyper-Threading
    * XHCI Hand-off
    * Os Type: Windows (You must remove all secure keys from Secure boot menu)
        * if not working this, please select "Other Os"
    * **IMPORTANT:** You must set Onboard GPU Memory to 64MB for use the graphics card without any problems
**Installation**
* Create an Catalina 10.15.4 Installation Stick
* Mount the EFI partition of the Installation USB (use Hackintool mount EFIs)
* Copy my EFI folder to the root of the EFI partition
* Go to EFI / OC and open the config.plist with Opencore Configurator (use latest version 2.5 buggy for 0.5.9 config files, use 2.6+)
* Now navigate to PlatformInfo -> Generic "click up/down button" you must see Mac product list, Select iMac 19,2. Now You must generate a serial by using the GENERATE buttons.
* Install MacOS Catalina

## General Troubleshooting
**The system does not boot**
Open config.plist with Opencore Configurator and change these values.
**You have to try each one individually**

* AppleCpuPmCfgLock : Enable - if CFG Lock is Enabled.
* AppleXcpmCfgLock : Enable - if CFG Lock is Enabled.
* SetupVirtualMap : Disable / Enable:  - First Disable
* RebuiltAppleMemoryMap : Enable / Disable:  - First Enable
* Cpuid1Data: "EB060800 00000000 00000000 00000000" without Quotes // May be required OS 10.15.4 or older then.
* Cpuid1Mask: "FFFFFFFF 00000000 00000000 00000000" without Quotes // May be required OS 10.15.4 or older then.
* DisabloIoMapper : Enable  - If you need Virtualization you must enable VT-d options in Bios settings.

**F1 Error after reboot**
> This problem usually happens when NVRAM is not working correctly.

Add this patch line to KERNEL -> PATCH tab
>Identifier: com.apple.driver.AppleRTC
>
>Base:  leave it blank
>
>Comment: F1 Patch fix
>
>Find: 75330FB7
>
>Replace: EB330FB7
>
>Count:1
>
>Enabled:true
>
>ReplaceMask: leave it blank
>
>MinKernel:leave it blank
>
>Limit:0
>
>Skip:0
>

## Tested Softwares
I use list in the real life and working correctly.
* Adobe Series
* Affinity Series
* Cinebench
* Geekbench
* Heaven Benchmark
* Intel Power Gadget

## Tools
* [Hackintool](https://github.com/headkaze/Hackintool/releases/) - For every Job :)
* [SSDTTime](https://github.com/corpnewt/SSDTTime) - Extract your right SSDT Files from ACPI.
* Opencore Configurator - Config.plist editor great software.
* IORegistryExplorer - show all system device details
* macIASL - to edit all your ACPI files that you extracted from the SSDTTime

That is all :)

## USB Port Map
![Hackintosh USB Port Map](https://raw.githubusercontent.com/yilmazca/intel-i9-10900K-Asus-prime-Z490A-hackintosh/master/Docs/ss3.png)
![Hackintosh USB Port Map Asus Z490](https://raw.githubusercontent.com/yilmazca/intel-i9-10900K-Asus-prime-Z490A-hackintosh/master/Docs/internal-usb-port-map.png)
![Hackintosh USB Port Map Asus Z490](https://raw.githubusercontent.com/yilmazca/intel-i9-10900K-Asus-prime-Z490A-hackintosh/master/Docs/usb-port-map.png)


## Screenshots
![Asus Prime Z490-A i9-10900K Hackintosh MacOS installation](https://github.com/yilmazca/intel-i9-10900K-Asus-prime-Z490A-hackintosh/blob/master/Docs/ss1.png?raw=true)
![Asus Prime Z490-A Video Proc](https://raw.githubusercontent.com/yilmazca/intel-i9-10900K-Asus-prime-Z490A-hackintosh/master/Docs/ss2.png)
![Intel UHD 630 Benchmark Test Heaven](https://raw.githubusercontent.com/yilmazca/intel-i9-10900K-Asus-prime-Z490A-hackintosh/master/Docs/ss4.png)
![Intel UHD 630 Benchmark Test Heaven](https://raw.githubusercontent.com/yilmazca/intel-i9-10900K-Asus-prime-Z490A-hackintosh/master/Docs/ss5.png)
![SanDisk Extreme Pro 1TB M.2 NVMe 3D SSD Disk Speed Test result](https://raw.githubusercontent.com/yilmazca/intel-i9-10900K-Asus-prime-Z490A-hackintosh/master/Docs/ss6.png)

