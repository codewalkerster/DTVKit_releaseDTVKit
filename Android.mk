LOCAL_PATH := $(call my-dir)

ifeq (,$(wildcard $(LOCAL_PATH)/../android-rpcservice))
include $(CLEAR_VARS)
LOCAL_MODULE := dtvkitserver_releaseinfo.txt
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
LOCAL_VENDOR_MODULE := true
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

ifeq ($(PRODUCT_SUPPORT_TUNER_FRAMEWORK), true)
include $(CLEAR_VARS)
    LOCAL_MODULE := libdtvkit_tuner_jni_wrapper
    LOCAL_SRC_FILES := libdtvkit_tuner_jni_wrapper.so
    LOCAL_MODULE_CLASS := SHARED_LIBRARIES
    LOCAL_MODULE_SUFFIX := .so
    LOCAL_VENDOR_MODULE := true
    LOCAL_SHARED_LIBRARIES :=  \
        libcutils \
        libutils \
        liblog \
        libbase \
        libdtvkit_tuner_jni \
        libjdvrlib-jni \
        libjcas_jni \
        libjniasplayer-jni
    LOCAL_LICENSE_KINDS := legacy_notice
    LOCAL_LICENSE_CONDITIONS := notice
include $(BUILD_PREBUILT)

$(warning "prebuilt libdtvkitserver.so")

include $(CLEAR_VARS)
    LOCAL_MODULE := libdtvkitserver
    LOCAL_SRC_FILES := libdtvkitserver.so
    LOCAL_MODULE_CLASS := SHARED_LIBRARIES
    LOCAL_MODULE_SUFFIX := .so
    LOCAL_VENDOR_MODULE := true
    LOCAL_SHARED_LIBRARIES :=  \
        libteec \
        libft2-aml \
        libutils \
        liblog \
        libdsm \
        libdtvkit_tuner_jni_wrapper \
        libbase \
        libhidlbase \
        libsystemcontrolservice \
        vendor.amlogic.hardware.systemcontrol@1.0 \
        vendor.amlogic.hardware.systemcontrol@1.1
    LOCAL_LICENSE_KINDS := legacy_notice
    LOCAL_LICENSE_CONDITIONS := notice
include $(BUILD_PREBUILT)
endif

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_PRELINK_MODULE := false
LOCAL_VENDOR_MODULE := true
LOCAL_STRIP_MODULE := false
LOCAL_SHARED_LIBRARIES := \
    android.hidl.allocator@1.0 \
    libam_adp \
    libam_mw \
    libamdvr \
    libbase \
    libbinder \
    libc++ \
    libc \
    libcrypto \
    libcurl \
    libcutils \
    libdl \
    libft2-aml \
    libhidlbase \
    libhidlmemory \
    libhidltransport \
    libjpeg \
    liblog \
    libm \
    libmediahal_resman \
    libmediahal_tsplayer \
    libmediandk \
    libsqlite \
    libssl \
    libutils \
    vendor.amlogic.hardware.dtvkitserver@1.0 \
    libaml_mp_sdk.vendor \
    libutilscallstack \
    libteec \
    libsecmem \
    libsystemcontrolservice \
    vendor.amlogic.hardware.systemcontrol@1.0 \
    vendor.amlogic.hardware.systemcontrol@1.1 \
    libfmq.vendor \
    libmeson_display_adapter_remote \
    libmeson_display_service

LOCAL_MODULE := dtvkitserver
LOCAL_SRC_FILES := dtvkitserver
LOCAL_INIT_RC := dtvkitserver.rc
LOCAL_VINTF_FRAGMENTS := vendor.amlogic.hardware.dtvkitserver@1.0.xml
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MULTILIB := 32
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_PRELINK_MODULE := false
LOCAL_VENDOR_MODULE := true
LOCAL_STRIP_MODULE := false
LOCAL_SHARED_LIBRARIES := \
    android.hidl.allocator@1.0 \
    libam_adp \
    libam_mw \
    libamdvr \
    libbase \
    libbinder \
    libc++ \
    libc \
    libcrypto \
    libcurl \
    libcutils \
    libdl \
    libft2-aml \
    libhidlbase \
    libhidlmemory \
    libhidltransport \
    libjpeg \
    liblog \
    libm \
    libmediahal_resman \
    libmediahal_tsplayer \
    libmediandk \
    libsqlite \
    libssl \
    libutils \
    vendor.amlogic.hardware.dtvkitserver@1.0 \
    libaml_mp_sdk.vendor \
    libutilscallstack \
    libteec \
    libsecmem \
    libsystemcontrolservice \
    libmeson_display_adapter_remote \
    libmeson_display_service \
    vendor.amlogic.hardware.systemcontrol@1.0 \
    vendor.amlogic.hardware.systemcontrol@1.1 \
    libfmq.vendor
LOCAL_MODULE := isdb_server
LOCAL_SRC_FILES := isdb_server
LOCAL_LICENSE_KINDS := legacy_notice
LOCAL_LICENSE_CONDITIONS := notice
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MULTILIB := 32
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_PRELINK_MODULE := false
LOCAL_VENDOR_MODULE := true
LOCAL_STRIP_MODULE := false
LOCAL_SHARED_LIBRARIES := \
    android.hidl.allocator@1.0 \
    libam_adp \
    libam_mw \
    libamdvr \
    libbase \
    libbinder \
    libc++ \
    libc \
    libcrypto \
    libcurl \
    libcutils \
    libdl \
    libft2-aml \
    libhidlbase \
    libhidlmemory \
    libhidltransport \
    libjpeg \
    liblog \
    libm \
    libmediahal_resman \
    libmediahal_tsplayer \
    libmediandk \
    libsqlite \
    libssl \
    libutils \
    vendor.amlogic.hardware.dtvkitserver@1.0 \
    libaml_mp_sdk.vendor \
    libutilscallstack \
    libteec \
    libsecmem \
    libsystemcontrolservice \
    libmeson_display_adapter_remote \
    libmeson_display_service \
    vendor.amlogic.hardware.systemcontrol@1.0 \
    vendor.amlogic.hardware.systemcontrol@1.1 \
    libfmq.vendor
LOCAL_MODULE := dvb_server
LOCAL_SRC_FILES := dvb_server
LOCAL_LICENSE_KINDS := legacy_notice
LOCAL_LICENSE_CONDITIONS := notice
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MULTILIB := 32
include $(BUILD_PREBUILT)

endif

include $(call all-makefiles-under,$(LOCAL_PATH))
