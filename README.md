# OrangeFox Recovery Project Tree for Cubot P50 (marlon)

![Cubot P50 (Marlon)](https://fdn2.gsmarena.com/vv/pics/cubot/cubot-p50-1.jpg)

> OrangeFox Recovery Project (OFRP) device tree for Cubot P50 (`marlon`), based on Android 12.1 minimal manifest with full TrustKernel TEE FBE decryption and dynamic super partition support.

---

## Device Specifications

| Specification | Details |
|:---|:---|
| **CPU** | Octa-core (4x2.0 GHz Cortex-A53 & 4x1.5 GHz Cortex-A53) |
| **Chipset** | MediaTek Helio P22 / P35 (MT6762 / MT6765) |
| **GPU** | PowerVR GE8320 |
| **RAM** | 6GB |
| **Storage** | 128GB (eMMC 5.1) |
| **Display** | 720 x 1520 pixels (19:9 ratio), waterdrop notch |
| **Shipped Android** | Android 11 (Stock EE/Global) |
| **Kernel Version** | 4.19.191+ |

---

## Verification & Status

### Blocking Checks
- [x] Correct screen resolution and recovery scaling (`OF_SCREEN_H=1520`)
- [x] Waterdrop notch status bar padding (`OF_STATUS_H=80`, `OF_CLOCK_POS=1`)
- [x] Working touchscreen and display
- [x] Hardware-backed `/data` decryption (FBE v2 AES-256-XTS + CTS, TrustKernel TEE)
- [x] Backup to Internal Storage & MicroSD
- [x] Restore from Internal Storage & MicroSD
- [x] Reboot to System / Bootloader / Recovery
- [x] ADB and MTP access

### Medium Checks
- [x] OrangeFox zip installer & update.zip sideloading
- [x] UI colors (RGB alignment)
- [x] Display sleep/wake (`TW_SCREEN_BLANK_ON_BOOT`)
- [x] Dynamic Super logical partitions (`system`, `vendor`, `product`)
- [x] Critical radio partitions backup/restore (`nvram`, `nvdata`, `nvcfg`, `protect_f`, `protect_s`, `persist`)
- [x] USB-OTG storage, keyboard, and mouse support
- [x] Keymaster 4.0 crypto HAL (`OF_DEFAULT_KEYMASTER_VERSION="4.0"`)

### Tools & Shell
- [x] GNU Bash shell (`FOX_USE_BASH_SHELL=1`)
- [x] GNU Nano editor (`FOX_USE_NANO_EDITOR=1`)
- [x] Tar, Sed, XZ utilities
- [x] Magiskboot patching (`OF_USE_MAGISKBOOT=1`)

---

## Compilation

### 1. Set up Build Environment & Sync Sources
```bash
# Initialize OrangeFox sync workspace
mkdir -p ~/OrangeFox_sync && cd ~/OrangeFox_sync
git clone https://gitlab.com/OrangeFox/sync.git
cd sync
./orangefox_sync.sh --branch 12.1 --path ~/fox_12.1
```

### 2. Clone Device Tree
```bash
cd ~/fox_12.1
git clone https://github.com/kelexine/ofrp-marlon device/cubot/marlon
```

### 3. Build Recovery Image & Installer Zip
```bash
cd ~/fox_12.1
source build/envsetup.sh
export FOX_BUILD_DEVICE="marlon"
export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL="C"
lunch ofox_marlon-eng
mka adbd recoveryimage -j$(nproc --all)
```

The compiled recovery image (`recovery.img`) and flashable zip (`OrangeFox-Unofficial-marlon.zip`) will be located in:
`out/target/product/marlon/`

---

## Flashing Instructions

### Via Fastboot
```bash
# 1. Reboot device to bootloader:
adb reboot bootloader

# 2. Disable AVB verification (mandatory on stock vbmeta):
fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img

# 3. Flash OrangeFox recovery partition:
fastboot flash recovery recovery.img

# 4. Reboot straight to recovery:
fastboot reboot recovery
```

### Via Recovery (Zip)
- Copy `OrangeFox-Unofficial-marlon.zip` to a MicroSD card or OTG drive.
- In your active custom recovery, select **Install** -> choose the zip -> swipe to flash.

---

## Credits
- [OrangeFox Recovery Project](https://gitlab.com/OrangeFox)
- [TeamWin Recovery Project](https://github.com/TeamWin)
- Maintainer: [kelexine](https://github.com/kelexine)
