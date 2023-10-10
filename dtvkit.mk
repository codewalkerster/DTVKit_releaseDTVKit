ifeq ($(PRODUCT_SUPPORT_DTVKIT), true)
ifeq ($(PRODUCT_SUPPORT_TUNER_FRAMEWORK),true)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,vendor/amlogic/reference/external/DTVKit/releaseDTVKit/config,$(TARGET_COPY_OUT_VENDOR)/etc/dtvkit/)
endif
endif