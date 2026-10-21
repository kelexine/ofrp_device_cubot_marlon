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

# Script: vendorsetup.sh
# Author: kelexine <https://github.com/kelexine>
# Date: 2026-10-21
# Purpose: OrangeFox build environment configuration for Cubot P50 (marlon)

FDEVICE="marlon"

fox_get_target_device() {
    local chkdev=$(echo "$BASH_SOURCE" | grep -w "$FDEVICE")
    if [ -n "$chkdev" ]; then
        FOX_BUILD_DEVICE="$FDEVICE"
    else
        chkdev=$(set | grep BASH_ARGV | grep -w "$FDEVICE")
        [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
    fi
}

if [ -z "$1" ] && [ -z "$FOX_BUILD_DEVICE" ]; then
    fox_get_target_device
fi

if [ "$1" = "$FDEVICE" ] || [ "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
    # Release / Metadata
    export OF_MAINTAINER="kelexine"
    export FOX_BUILD_TYPE="Unofficial"
    export FOX_VERSION="R12.1_0"

    # Display / Notch (720x1520, 19:9, centered waterdrop notch)
    export OF_SCREEN_H=1520
    export OF_STATUS_H=80
    export OF_STATUS_INDENT_LEFT=48
    export OF_STATUS_INDENT_RIGHT=48
    export OF_CLOCK_POS=1
    export OF_ALLOW_DISABLE_NAVBAR=1

    # Crypto / Keymaster / Security
    export OF_DEFAULT_KEYMASTER_VERSION="4.0"
    export OF_USE_MAGISKBOOT=1
    export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
    export OF_DONT_PATCH_ON_FRESH_INSTALLATION=1
    export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
    export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
    export OF_FIX_OTA_UPDATE_MANUAL_FLASHING=1

    # Tools & GNU Shell
    export FOX_USE_BASH_SHELL=1
    export FOX_ASH_IS_BASH=1
    export FOX_USE_NANO_EDITOR=1
    export FOX_USE_TAR_BINARY=1
    export FOX_USE_SED_BINARY=1
    export FOX_USE_XZ_UTILS=1
    export FOX_REPLACE_BUSYBOX_PS=1
    export FOX_REPLACE_TOOLBOX_GETPROP=1

    # Quick Backup List
    export OF_QUICK_BACKUP_LIST="/boot;/data;"

    # Recovery Image Builder
    export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1

    # Environmental Defaults
    export ALLOW_MISSING_DEPENDENCIES=true
    export LC_ALL="C"
fi
