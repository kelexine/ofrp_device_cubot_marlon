# Changelog

All notable changes to the TWRP Recovery project for the **Cubot P50 (`marlon`)** will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.2.0] - 2026-10-14

### Changed
- **CI/CD Pipeline Modernization**:
  - Pointed device tree repository URL to `kelexine/twrp_device_cubot_marlon`.
  - Added runner disk cleanup (+40 GB free space) and 16 GB dynamic swap allocation to prevent runner build crashes.
  - Added automated calculation of `MD5SUMS.txt` and `SHA256SUMS.txt` for build artifacts.
  - Added automated fastboot tarball packaging (`twrp-marlon-fastboot.tar.gz`) and release publishing via `softprops/action-gh-release@v2`.
- **Security Patch Dates & Anti-Rollback**: Set `PLATFORM_SECURITY_PATCH` and `VENDOR_SECURITY_PATCH` to future epoch (`2099-12-31`) in `BoardConfig.mk` to prevent TrustKernel TEE rollback gating during data decryption across varying ROM patch levels.
- **Partition Flags Alignment**: Cleaned up indentation and comments across `recovery/root/system/etc/twrp.flags`.

---

## [1.1.0] - 2024-08-16

### Added
- **FBE Data Decryption**: Enabled File-Based Encryption (FBE v2) decryption for EXT4 `/data` partition using AES-256-XTS and CTS encryption.
- **TrustKernel TEE Hardware Services**: Integrated `teed` daemon, `libSoftGatekeeper`, Keymaster 4.0 (`android.hardware.keymaster@4.0-service.trustkernel`), and keymaster attestation.
- **Fastbootd**: Enabled userspace fastboot (`fastbootd`) support for flashing dynamic logical partitions directly.
- **USB OTG Storage**: Added auto-detection and UTF-8 charset flags for external USB storage devices.

### Fixed
- Corrected screen offset and orientation properties in `BoardConfig.mk`.
- Fixed touchscreen init timing during early recovery boot.

---

## [1.0.0] - 2024-04-10

### Added
- Initial TWRP 12.1 device tree bringup for Cubot P50 (`marlon`) targeting MediaTek MT6765/MT6762.
- Verified display, touchscreen, ADB, MTP, brightness control, and battery telemetry.
- Dynamic super partition layout definitions (`system`, `vendor`, `product`).
- NVRAM and radio calibration backup support (`nvram`, `nvdata`, `nvcfg`, `protect_f`, `protect_s`).
