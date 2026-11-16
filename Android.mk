#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),marlon)
MARLON_DTB_CFG := $(LOCAL_PATH)/configs/dtb.cfg
include $(call all-subdir-makefiles,$(LOCAL_PATH))

ifneq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
ifneq ($(wildcard $(TARGET_KERNEL_SOURCE)),)
MARLON_MKDTIMG := prebuilts/misc/$(HOST_PREBUILT_TAG)/libufdt/mkdtimg
MARLON_DTB_DIR := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/arch/$(TARGET_ARCH)/boot/dts/mediatek

$(PRODUCT_OUT)/dtb.img: $(PRODUCT_OUT)/kernel $(MARLON_DTB_CFG)
	@echo "Packaging MTK dtb.img via mkdtimg -> $@"
	$(MARLON_MKDTIMG) cfg_create $@ $(MARLON_DTB_CFG) -d $(MARLON_DTB_DIR)

$(PRODUCT_OUT)/recovery.img: $(PRODUCT_OUT)/dtb.img
endif
endif
endif
