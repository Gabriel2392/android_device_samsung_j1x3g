# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

LOCAL_PATH := device/samsung/j120h
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(LOCAL_PATH)/file_contexts:recovery/root/prebuilt_file_contexts



$(call inherit-product, device/samsung/j120h/full_j120h.mk)

PRODUCT_NAME := cm_j120h
