DTVKIT_HWCONFIG_FILE := config-$(DTVKIT_HW_CONFIG_SOC).xml

ifeq ($(PRODUCT_SUPPORT_TUNER_FRAMEWORK),true)
$(warning "Copy dtvkit hw_config/$(DTVKIT_HWCONFIG_FILE) to $(TARGET_COPY_OUT_VENDOR)/etc/dtvkit/config.xml")
PRODUCT_COPY_FILES += vendor/amlogic/reference/external/DTVKit/releaseDTVKit/hw_config/$(DTVKIT_HWCONFIG_FILE):$(TARGET_COPY_OUT_VENDOR)/etc/dtvkit/config.xml

$(warning "Copy dtvkit sw_config to $(TARGET_COPY_OUT_VENDOR)/etc/dtvkit")
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,vendor/amlogic/reference/external/DTVKit/releaseDTVKit/sw_config,$(TARGET_COPY_OUT_VENDOR)/etc/dtvkit/)
endif
