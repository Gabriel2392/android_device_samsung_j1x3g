
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

LOCAL_PATH := device/samsung/j120h

LOCAL_PATH := device/samsung/j120h
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(LOCAL_PATH)/init.recovery.board.rc:root/init.recovery.board.rc \
    $(LOCAL_PATH)/init.recovery.universal.rc:root/init.recovery.universal.rc \
    $(LOCAL_PATH)/twrp.fstab:recovery/root/etc/recovery.fstab


$(call inherit-product, build/target/product/full.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_j120h
PRODUCT_DEVICE := j120h
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SM-j120h
