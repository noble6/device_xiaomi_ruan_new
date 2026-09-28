#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# ruan builds from the dizi board config; the kernel, modules and base dtbs are
# shared (research/ruan.md in the bring-up repo).
DIZI_VENDOR := ruan
include device/xiaomi/dizi/BoardConfig.mk

RUAN_PATH := device/xiaomi/ruan

# Kernel: the ruan stock dtbo. The dizi ROM's ruan entry has no camera nodes;
# this one carries both boards and its dizi entry matches dizi's own.
BOARD_PREBUILT_DTBOIMAGE := $(RUAN_PATH)/prebuilts/dtbo.img

# HIDL
DEVICE_MANIFEST_FILE += $(RUAN_PATH)/configs/hidl/manifest_ruan.xml

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# System properties
TARGET_VENDOR_PROP += $(RUAN_PATH)/props/vendor.prop
