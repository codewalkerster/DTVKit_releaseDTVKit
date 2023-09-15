ifeq ($(PRODUCT_SUPPORT_DTVKIT), true)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,vendor/amlogic/reference/external/DTVKit/releaseDTVKit/config,$(TARGET_COPY_OUT_VENDOR)/etc/dtvkit/)
endif