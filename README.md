Firstly sorry for english, I will translate directly..

The System I Use

• Processor: Intel i9-10900K Comet Lake 3.7GHZ - 5.3GHZ Turbo => (Power management TDP values ​​don't seem to work properly)

• Motherboard: Asus Prime Z490-A - I preferred this motherboard because there are not too many components on it (bluetooth, Wifi) because it is more stable and more interfering.
RAM: Corsair DDR4 16GB 3000MHZ (Single Module)

• Internal GPU: Intel UHD Graphics 630 (On processor) => (AAPL, ig-platform-id and device-id are required)

• External GPU: - (Will Be Updated When Added)
Disk: SanDisk Extreme Pro 1TB M.2 NVMe 3D SSD

• Ethernet 1: Intel® I225-V 2.5Gb Ethernet - Works with FakeID. I did not test speed.

• Ethernet 1: Tp-Link 3468 1Gbit Pcie Card - Realtek8111 works with the latest version.

• Internal Audio: Realtek ALC S1220A => (layout-id and device-id required)
External Sound: Creative Sound Blaster Audigy PCIe RX 7.1 - (NOT WORKING YET)
SMBIOS: iMac19.1


Which Software I use ?

• Installation was done on APFS file system.

• Hackintool - See all devices, disks, GPU and patches in short, your hand and foot ￼

• Adobe Photoshop, Premier Pro, Illustrator - runs smooth full performance.

• Parallels Desktop - Founded for VT-d Virtualization works smoothly.

Before You Begin
* First of all, BE SURE ￼ I tried about 1 day for correct installation and 2 days for stability. Having a stable hackintosh requires considerable effort.
* There is no SMBIOS information in EFI / OC / Config.plist. Please do not forget to create SMBIOS.
* Required SSDT Files SSDT-PLUG.aml, SSDT-AWAC.aml, SSDT-EC.aml. You can download current versions from Opencore Comet Lake.
* Those who will install with Catalina 15.5.4 must add the correct values ​​of the Cpuid1Data and Cpuid1Mask section in the KERNEL section. Without these values, you may not be able to switch to the setup screen.
Cpuid1Data: "EB060800 00000000 00000000 00000000" (without quotes)
Cpuid1Mask: "FFFFFFFF 00000000 00000000 00000000" (without quotes)
* If there is CFG Lock in your Bios settings, be sure to turn it off. If you don't know the default CFG Lock value, activate AppleCpuPmCfgLock and AppleXcpmCfgLock under KERNEL in Opencore settings.
* If you are freezing on the first screen, under the BOOTER section, close and try SetupVirtualMap, RebuildAppleMemoryMap, SyncRuntimePermission respectively.
* If you are a software developer like me, you may need virtualization. Activate VT-d on Bios and activate DisabloIoMapper under KERNEL.
* When you make a change in your EFI folder, do not forget to make RESET NVRAM in Opencore Boot menu.

Debugging
With Opencore you can check for common errors on the Opencore Possible Problems and Solutions page.

* F1 Error: After installing, I saw Bios giving F1 error at every startup. You need to do F1 Patch about this. Add a new line to the list in the KERNEL Patch.
Identifier: com.apple.driver.AppleRTC | Base: Leave blank | Comment: F1 Patch fix | Find: 75330FB7 | Replace: EB330FB7 | Count: 1 | Enabled: true | ReplaceMask: Empty | MinKernel: Empty | Limit: 0 | Skip: 0

Do not switch directly to Opencore version 0.5.9. Create a copy of Sample.plist that comes with Opencore 0.5.9 and copy it from the old config (0.5.8). There are differences between 0.5.8 and 0.5.9 config files. I experienced serious errors and time losses due to these differences :) please be careful. Even if opencore configurator 2.5 or NDK version, opencore is breaking 0.5.9 config file and saving it in 0.5.8 format. Thus, when you want to use your opencore file, you encounter many errors.

For now, use ProperTree instead of Configurator for Opencore 0.5.9
