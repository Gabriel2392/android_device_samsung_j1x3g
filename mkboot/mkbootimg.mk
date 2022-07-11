XZ_BIN := $(shell which xz)
XZ_BOOT_RAMDISK := $(recovery_uncompressed_ramdisk).xz
MKBOOTIMG := device/samsung/j1x3g/mkboot/mkbootimg
SIGNATURE := device/samsung/j1x3g/mkboot/signature.txt

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(recovery_ramdisk) $(recovery_uncompressed_ramdisk) $(recovery_kernel)
	@echo "Compressing recovery ramdisk with xz..."
	$(hide) rm -f $(XZ_BOOT_RAMDISK)
	$(XZ_BIN) -9kf $(recovery_uncompressed_ramdisk)
	$(hide) cp -f $(XZ_BOOT_RAMDISK) $(recovery_ramdisk)
	@echo "Making recovery image..."
	$(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) cat $(SIGNATURE) >> $@
	@echo "Made recovery image: $@"
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)

 $(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES) $(LZMA_BOOT_RAMDISK)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
