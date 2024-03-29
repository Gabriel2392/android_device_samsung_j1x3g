# Define Local path
LOCAL_PATH := device/samsung/j1x3g

# Vendorname
BOARD_VENDOR := samsung

# Ignore missing deps
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true

# Platform
TARGET_BOARD_PLATFORM := sc8830
TARGET_BOARD_PLATFORM_GPU := ARM Mali-400MP2

# Bootloader
TARGET_NO_BOOTLOADER := true
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TARGET_BOOTLOADER_BOARD_NAME := SC7727SE

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/mkboot/mkbootimg.mk
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --dt $(LOCAL_PATH)/kernel/dt.img
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel/zImage
BOARD_KERNEL_IMAGE_NAME := zImage

# MTD Partitions
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/root/etc/recovery.fstab

# FS
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_NO_REAL_SDCARD := false
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/extSdCard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "extSdCard"
RECOVERY_SDCARD_ON_DATA := true

# TWRP
TW_INCLUDE_FB2PNG := true
TW_SCREEN_BLANK_ON_BOOT := true
TARGET_COMMON_NAME := SM-J120H
TW_DEVICE_VERSION := Samsung Galaxy J1 (2016) | SM-J120H
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone1/temp"
TW_THEME := portrait_mdpi
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 255
RECOVERY_GRAPHICS_FORCE_SINGLE_BUFFER := true

# USB Mounting
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_MTP_DEVICE := "/dev/mtp_usb"
BOARD_UMS_LUNFILE := "/sys/devices/20200000.usb/gadget/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/20200000.usb/gadget/lun0/file"

# LZMA Compression
LZMA_COMPRESSION := -9
LZMA_RAMDISK_TARGETS := recovery
