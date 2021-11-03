# T480-OpenCore-Hackintosh

<img align="right" src="https://github.com/EETagent/T480-OpenCore-Hackintosh/raw/master/Other/README_Resources/ThinkPad.gif" alt="T480 macOS" width="430">

[![OpenCore](https://img.shields.io/badge/OpenCore-0.7.4-lightblue.svg)](https://github.com/acidanthera/OpenCorePkg)
[![macOS-Stable](https://img.shields.io/badge/macOS-12.0-purple.svg)](https://www.apple.com/macos/monterey/)
[![Windows-Stable](https://img.shields.io/badge/Windows-11-blue.svg)](https://www.microsoft.com/en-us/windows)

## Introduction

<details>

<summary><strong>Hardware</strong></summary>
<br>


[![UEFI](https://img.shields.io/badge/UEFI-N24ET61W-lightgrey)](https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/thinkpad-t-series-laptops/thinkpad-t480-type-20l5-20l6/downloads/ds502355)

| Category  | Component                         | Note                                                         |
| --------- | --------------------------------- | ------------------------------------------------------------ |
| CPU       | Intel Core i7-8550U               | 20L50000MC                                                   |
| GPU       | Intel UHD 620                     |                                                              |
| SSD       | Western Digital 970 SN750 500GB   | Replaced cursed PM 981 which stil doesn't work reliably      |
| Memory    | 8+16GB DDR4 2400Mhz               |                                                              |
| Battery   | Dual battery                      |                                                              |
| Camera    | 720p Camera                       |                                                              |
| Wifi & BT | BCM1820A                          |                                                              |
| Input     | PS2 Keyboard & Synaptics TrackPad | [YogaSMC](https://github.com/zhen-zen/YogaSMC) for media keys like microphone switch, etc. PrtSc is mapped as F13. |

</details>  

<details>

<summary><strong>Main software</strong></summary>
<br>

| Component      | Version         |
| -------------- | --------------- |
| macOS Monterey | 12.0.1 (21A559) |
| macOS Big Sur  | 11.6 (20G165)   |
| OpenCore       | v0.7.5          |

</details>

<details>

<summary><strong>Kernel extensions</strong></summary>
<br>

| Kext                  | Version        |
| :-------------------- | -------------- |
| AirportBrcmFixup      | 2.1.4          |
| AppleALC              | 1.6.6          |
| BrightnessKeys        | 1.0.2          |
| CPUFriend             | 1.2.4          |
| CPUFriendDataProvider | i7-8550U       |
| HibernationFixup      | 1.4.5          |
| BlueToolFixup         | 2.6.1          |
| BrcmBluetoothInjector | 2.6.1          |
| BrcmFirmwareData      | 2.6.1          |
| BrcmPatchRAM3         | 2.6.1          |
| IntelMausi            | 1.0.8          |
| Lilu                  | 1.5.7          |
| NoTouchID             | 1.0.4          |
| NVMeFix               | 1.1.0          |
| RTCMemoryFixup        | 1.0.8          |
| VirtualSMC            | 1.2.7          |
| VoltageShift          | Disabled, 1.22 |
| VoodooPS2Controller   | 2.2.7          |
| VoodooRMI             | 1.3.4          |
| VoodooSMBus           | 3.0.0          |
| WhateverGreen         | 1.5.5          |
| YogaSMC               | 1.5.1          |

</details>

<details>

<summary><strong>UEFI drivers</strong></summary>
<br>

|     Driver      | Version           |
| :-------------: | ----------------- |
|  AudioDxe.efi   | OpenCorePkg 0.7.5 |
|   HfsPlus.efi   | OcBinaryData      |
| OpenCanopy.efi  | OpenCorePkg 0.7.5 |
| OpenRuntime.efi | OpenCorePkg 0.7.5 |

</details>

## Before installation

<details>  

<summary><strong>UEFI settings</strong></summary>
<br>

**Security**

- `Security Chip` **Disabled**
- `Memory Protection -> Execution Prevention` **Enabled**
- `Virtualization -> Intel Virtualization Technology` **Enabled**
- `Virtualization -> Intel VT-d Feature` **Enabled**
- `Anti-Theft -> Computrace -> Current Setting` **Disabled**
- `Secure Boot -> Secure Boot` **Disabled**
- `Intel SGX -> Intel SGX Control` **Disabled**
- `Device Guard` **Disabled**

**Startup**

- `UEFI/Legacy Boot` **UEFI Only**
- `CSM Support` **No**

**Thunderbolt**

- `Thunderbolt BIOS Assist Mode` **Disabled**
- `Wake by Thunderbolt(TM) 3` **Disabled**
- `Security Level` **User Authorization**
- `Support in Pre Boot Environment -> Thunderbolt(TM) device` **Enabled**

</details>  

<details>

<summary><strong>Own prev-lang-kbd</strong></summary>
<br>

Either add as a string or as a data ( HEX data [(ProperTree)](https://github.com/corpnewt/ProperTree) )

Format is lang-COUNTRY:keyboard

- 🇨🇳 | [252] en - ABC --> zh-Hans:252 --> 7A682D48 616E733A 323532
- 🇺🇸 | [0] en_US - U.S --> en-US:0 --> 656e2d55 533a30

etc.

[AppleKeyboardLayouts.txt](https://github.com/acidanthera/OpenCorePkg/blob/master/Utilities/AppleKeyboardLayouts/AppleKeyboardLayouts.txt)

</details>

<details>

<summary><strong>Secure Boot (Optional)</strong></summary>
<br>

1. Set Secure Boot to Setup Mode. Secure Boot should be reported as off by UEFI main tab
2. Create FAT32 formatted USB
3. Create EFI folder in the root of the newly formatted flash drive and move there content of SecureBoot/KeyTool
4. Boot flash drive via F12 boot menu
5. Choose **Edit keys**

<img src="https://github.com/EETagent/T480-OpenCore-Hackintosh/raw/master/Other/README_Resources/SecureBoot/MainMenu.png" alt="Main menu">

6. Start by **replacing** Signature Database. Select .auth file

<img src="https://github.com/EETagent/T480-OpenCore-Hackintosh/raw/master/Other/README_Resources/SecureBoot/ManipulateKey.png" alt="Select key to manipulate with">
<img src="https://github.com/EETagent/T480-OpenCore-Hackintosh/raw/master/Other/README_Resources/SecureBoot/SelectAuth.png" alt="Select .auth file">


7. Do the same for Key Exchange Keys Database (KEK) and Platform Key (PK) **in this order**
8. Exit and shutdown your machine
9. Boot into the UEFI settings and check if Secure Boot is reported as `on`
10. Boot you favorite OS with Secure Boot enabled

[More detailed information here](https://habr.com/en/post/273497)

```diff
! Still quite experimental
```

</details>

## Status

<details>  


<summary><strong>What's working ✅</strong></summary>

- [x] Battery percentage
- [x] Bluetooth - Broadcom BCM1820A
- [x] Boot chime
- [x] Boot menu `OpenCanopy` 
- [x] CPU power management / performance `Now on par with Windows without XTU undervolt.`
- [x] FireVault 2 `No config.plist changes needed` 
- [x] GPU UHD 620 hardware acceleration / performance 
- [x] HDMI `Closed and opened lid. With audio.`
- [x] iMessage, FaceTime, App Store, iTunes Store. **Generate your own SMBIOS**
- [x] Intel I219V Ethernet port
- [x] Keyboard `Volume and brightness hotkeys. Another media keys with YogaSMC.`
- [x] Microphone `With keyboard switch using ThinkPad Assistant.`
- [x] Realtek® ALC3287 ("ALC257") Audio
- [x] SD card reader `Fortunately, USB connected.`
- [x] Sidecar wired `Works with 15,2 SMBIOS.`
- [x] Sleep/Wake 
- [x] TouchPad `1-5 fingers swipe works. Emulate force touch using longer and more voluminous touch.`
- [x] TrackPoint  `Works perfectly. Just like on Windows or Linux.`
- [x] USB Ports `USB Map is different for devices with Windows Hello camera.`
- [x] Web camera
- [x] Wifi - Broadcom BCM1820A
- [x] DRM `Widevine, validated on Firefox 82. WhateverGreen's DRM is broken on Big Sur`
- [x] Windows 11 boot from OC boot menu

</details>  

<details>  

<summary><strong>What's not working ⚠️</strong></summary>

- [ ] Fingerprint reader  `There is finally after many years working driver for Linux (python-validity), don't expect macOS driver any time soon.`

- [ ] PM 981 `Still unstable.`

- [ ] Sidecar wireless `If you want to use this feature, buy a compatible Broadcom card!`



</details>  

<details>  

<summary><strong>Need help</strong></summary>

- [ ] Thunderbolt to DP  `Can't recognize 4k display, but is normal under windows booting via OC.`
- [ ] Touchpad and Trackpoint will not work in windows 11 after wakeup from sleep.

</details>  

##  Credits

https://gitee.com/dhbxs/think-pad-t480-open-core0.6.7-hackintosh/tree/main

https://github.com/EETagent/T480-OpenCore-Hackintosh

https://github.com/tylernguyen/x1c6-hackintosh

https://github.com/the-darkvoid/XPS9360-macOS
