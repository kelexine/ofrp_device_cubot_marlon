#
# Copyright (C) 2026 The OrangeFox Recovery Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from core products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit from marlon device
$(call inherit-product, device/cubot/marlon/device.mk)

# Inherit some common twrp/fox stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

PRODUCT_DEVICE := marlon
PRODUCT_NAME := ofox_marlon
PRODUCT_BRAND := CUBOT
PRODUCT_MODEL := P50
PRODUCT_MANUFACTURER := CUBOT MOBILE LIMITED
PRODUCT_RELEASE_NAME := CUBOT P50

PRODUCT_BOARD := v956

# Add fingerprint from Stock ROM build.prop
BUILD_FINGERPRINT := "CUBOT/P50_EEA/P50:11/RP1A.200720.011/20220816:user/release-keys"
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=P50_EEA \
    PRODUCT_NAME=P50_EEA \
    PRIVATE_BUILD_DESC="P50_EEA-user 11 RP1A.200720.011 root.20220816 release-keys"
