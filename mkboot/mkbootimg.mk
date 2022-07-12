LZMA_BIN := $(shell which lzma)
LZMA_BOOT_RAMDISK := $(recovery_uncompressed_ramdisk).lzma
MKBOOTIMG := device/samsung/j1x3g/mkboot/mkbootimg
SIGNATURE := device/samsung/j1x3g/mkboot/signature.txt

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(recovery_ramdisk) $(recovery_uncompressed_ramdisk) $(recovery_kernel)
	@echo "Compressing recovery ramdisk with lzma..."
	$(hide) rm -f $(LZMA_BOOT_RAMDISK)
	$(LZMA_BIN) -9zkf $(recovery_uncompressed_ramdisk)
	$(hide) mv -f $(LZMA_BOOT_RAMDISK) $(recovery_ramdisk)
	@echo "Making recovery image..."
	$(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) cat $(SIGNATURE) >> $@
	@echo "Made recovery image: $@"
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)

 $(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
