DTVKIT_HWCONFIG_FILE := vendor/amlogic/reference/external/DTVKit/releaseDTVKit/hw_config/config-$(DTVKIT_HW_CONFIG_SOC).xml

ifeq ($(wildcard $(DTVKIT_HWCONFIG_FILE)),)
$(error "$(DTVKIT_HWCONFIG_FILE) does not exist, please add config-$(DTVKIT_HW_CONFIG_SOC).xml")
else
$(warning "Copy dtvkit hw_config/$(DTVKIT_HWCONFIG_FILE) to $(TARGET_COPY_OUT_VENDOR)/etc/dtvkit/config.xml")
PRODUCT_COPY_FILES += $(DTVKIT_HWCONFIG_FILE):$(TARGET_COPY_OUT_VENDOR)/etc/dtvkit/config.xml
endif

$(warning "Copy dtvkit sw_config to $(TARGET_COPY_OUT_VENDOR)/etc/dtvkit")
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,vendor/amlogic/reference/external/DTVKit/releaseDTVKit/sw_config,$(TARGET_COPY_OUT_VENDOR)/etc/dtvkit/)

