# Release Notes Template — TWRP Recovery for Cubot P50 (marlon)

## 📱 TWRP {{VERSION}} for Cubot P50 (`marlon`)

**Release Tag:** `{{RELEASE_TAG}}`  
**Build Date:** `{{BUILD_DATE}}`  
**Maintainer:** [kelexine](https://github.com/kelexine)  
**Status:** Stable / Full FBE Decryption & Dynamic Super Partition Support

---

### 🚀 Highlights & Key Changes
- **TrustKernel TEE Data Decryption**: Full hardware-backed decryption for EXT4 `/data` partition with FBE v2 (`aes-256-xts:aes-256-cts:v2`).
- **Dynamic Logical Partitions (Super)**: Direct flashing, backup, and wiping of `system`, `vendor`, and `product` logical block devices.
- **Fastbootd Mode**: Integrated userspace fastboot daemon for flashing logical images over USB.
- **Radio & Hardware Backup**: Comprehensive backup for critical device-unique partitions: `NVRAM`, `NVDATA`, `NVCFG`, `protect_f`, `protect_s`, and `proinfo`.
- **OTG & MicroSD**: Full external storage support with UTF-8 filesystem options.

---

### 📦 Artifacts & Checksums

| File | Type | Description |
|---|---|---|
| `recovery.img` | Binary Image | Direct recovery partition flash image |
| `twrp-marlon-{{VERSION}}.img` | Binary Image | Version-tagged recovery image |
| `twrp-marlon-fastboot.tar.gz` | Archive | Compressed archive containing recovery image |
| `MD5SUMS.txt` | Checksum | MD5 checksum hash verification |
| `SHA256SUMS.txt` | Checksum | SHA-256 cryptographic verification |

---

### ⚡ Flashing Instructions

#### Prerequisites
- Device bootloader must be unlocked.
- Minimal ADB and Fastboot installed on your host PC.
- Android platform tools (SDK) up to date.

#### Installation Steps
```bash
# 1. Connect phone and reboot to fastboot/bootloader:
adb reboot bootloader

# 2. Check device connection:
fastboot devices

# 3. Disable Android Verified Boot (AVB) flags to avoid bootloops:
fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img

# 4. Flash TWRP Recovery:
fastboot flash recovery recovery.img

# 5. Boot directly into TWRP recovery:
fastboot reboot recovery
```

> [!IMPORTANT]
> Always boot directly into TWRP on the first boot after flashing. If the stock OS boots first, it may automatically overwrite custom recovery with the stock recovery image.

---

### 📋 Verified Functionality Checklist
- [x] Touchscreen & Display Backlight
- [x] FBE Data Decryption (TrustKernel TEE)
- [x] Dynamic Super Partitions (System, Vendor, Product)
- [x] Fastbootd Mode
- [x] ADB Sideload & ADB Shell
- [x] MTP File Transfer
- [x] MicroSD Card & USB-OTG Mount/Backup
- [x] Battery Telemetry & CPU Thermal Reporting
- [x] Backup & Restore (Internal, MicroSD, OTG)

---

### 💬 Support & Bug Reports
Report issues or feature requests on the [GitHub Issue Tracker](https://github.com/kelexine/twrp_device_cubot_marlon/issues).
