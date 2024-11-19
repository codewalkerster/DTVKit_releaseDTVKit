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

$(warning "prebuilt libdtvkitserver.so")
include $(CLEAR_VARS)
    LOCAL_MODULE := libdtvkitserver
    LOCAL_SRC_FILES := libdtvkitserver.so
    LOCAL_MULTILIB := 32
    LOCAL_MODULE_CLASS := SHARED_LIBRARIES
    LOCAL_MODULE_SUFFIX := .so
    LOCAL_VENDOR_MODULE := true
    LOCAL_SHARED_LIBRARIES :=  \
        libdtvkit_platform_ATF \
        liblog
    LOCAL_LICENSE_KINDS := legacy_notice
    LOCAL_LICENSE_CONDITIONS := notice
include $(BUILD_PREBUILT)

$(warning "prebuilt libdvbserver.so")
include $(CLEAR_VARS)
    LOCAL_MODULE := libdvbserver
    LOCAL_SRC_FILES := libdvbserver.so
    LOCAL_MULTILIB := 32
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
        libdtvkit_platform_ATF \
        libbase \
        libhidlbase \
        libsystemcontrolservice \
        vendor.amlogic.hardware.systemcontrol@1.0 \
        vendor.amlogic.hardware.systemcontrol@1.1
    LOCAL_LICENSE_KINDS := legacy_notice
    LOCAL_LICENSE_CONDITIONS := notice
include $(BUILD_PREBUILT)

$(warning "prebuilt libisdbserver.so")
include $(CLEAR_VARS)
    LOCAL_MODULE := libisdbserver
    LOCAL_SRC_FILES := libisdbserver.so
    LOCAL_MULTILIB := 32
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
        libdtvkit_platform_ATF \
        libbase \
        libhidlbase \
        libsystemcontrolservice \
        vendor.amlogic.hardware.systemcontrol@1.0 \
        vendor.amlogic.hardware.systemcontrol@1.1
    LOCAL_LICENSE_KINDS := legacy_notice
    LOCAL_LICENSE_CONDITIONS := notice
include $(BUILD_PREBUILT)

$(warning "prebuilt libatscserver.so")
include $(CLEAR_VARS)
    LOCAL_MODULE := libatscserver
    LOCAL_SRC_FILES := libatscserver.so
    LOCAL_MULTILIB := 32
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
        libdtvkit_platform_ATF \
        libbase \
        libhidlbase \
        libsystemcontrolservice \
        vendor.amlogic.hardware.systemcontrol@1.0 \
        vendor.amlogic.hardware.systemcontrol@1.1
ifeq ($(PRODUCT_SUPPORT_CCDATABASE), true)
    LOCAL_SHARED_LIBRARIES += libxds
endif
    LOCAL_LICENSE_KINDS := legacy_notice
    LOCAL_LICENSE_CONDITIONS := notice
include $(BUILD_PREBUILT)
endif

ifeq ($(shell test $(PLATFORM_SDK_VERSION) -ge 35&& echo OK),OK)
    $(warning "Build on Android V+, DTVKIT AIDL ENABLE")
    DTVKIT_AIDL_ENABLE := true
else
    $(warning "Build on Android U-, DTVKIT HIDL ENABLE")
    DTVKIT_AIDL_ENABLE := false
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
    libaml_mp_sdk.vendor \
    libutilscallstack \
    libteec \
    libsecmem \
    libsystemcontrolservice \
    vendor.amlogic.hardware.systemcontrol@1.0 \
    vendor.amlogic.hardware.systemcontrol@1.1 \
    libfmq.vendor \
    libmeson_display_adapter_remote \
    libmeson_display_service \
    libbinder_ndk \
    libhardware \
    libdtvkit_platform

ifeq ($(DTVKIT_AIDL_ENABLE), true)
LOCAL_SHARED_LIBRARIES += \
    vendor.amlogic.hardware.dtvkitserver-V1-ndk
LOCAL_VINTF_FRAGMENTS := vendor.amlogic.hardware.dtvkitserver_aidl.xml
else
LOCAL_SHARED_LIBRARIES += \
    vendor.amlogic.hardware.dtvkitserver@1.0
LOCAL_VINTF_FRAGMENTS := vendor.amlogic.hardware.dtvkitserver@1.0.xml
endif

LOCAL_MODULE := dtvkitserver
LOCAL_SRC_FILES := dtvkitserver
LOCAL_INIT_RC := dtvkitserver.rc
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
    libaml_mp_sdk.vendor \
    libutilscallstack \
    libteec \
    libsecmem \
    libsystemcontrolservice \
    libmeson_display_adapter_remote \
    libmeson_display_service \
    vendor.amlogic.hardware.systemcontrol@1.0 \
    vendor.amlogic.hardware.systemcontrol@1.1 \
    libfmq.vendor \
    libbinder_ndk \
    libhardware \
    libdtvkit_platform

ifeq ($(DTVKIT_AIDL_ENABLE), true)
LOCAL_SHARED_LIBRARIES += \
    vendor.amlogic.hardware.dtvkitserver-V1-ndk
else
LOCAL_SHARED_LIBRARIES += \
    vendor.amlogic.hardware.dtvkitserver@1.0
endif
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
    libaml_mp_sdk.vendor \
    libutilscallstack \
    libteec \
    libsecmem \
    libsystemcontrolservice \
    libmeson_display_adapter_remote \
    libmeson_display_service \
    vendor.amlogic.hardware.systemcontrol@1.0 \
    vendor.amlogic.hardware.systemcontrol@1.1 \
    libfmq.vendor \
    libbinder_ndk \
    libhardware \
    libdtvkit_platform

ifeq ($(DTVKIT_AIDL_ENABLE), true)
LOCAL_SHARED_LIBRARIES += \
    vendor.amlogic.hardware.dtvkitserver-V1-ndk
else
LOCAL_SHARED_LIBRARIES += \
    vendor.amlogic.hardware.dtvkitserver@1.0
endif
LOCAL_MODULE := dvb_server
LOCAL_SRC_FILES := dvb_server
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
    libbase \
    libbinder \
    libc++ \
    libc \
    libcrypto \
    libcurl \
    libcutils \
    libft2-aml \
    libhidlbase \
    libhidlmemory \
    libhidltransport \
    libjpeg \
    liblog \
    libmediahal_resman \
    libmediahal_tsplayer \
    libmediandk \
    libsqlite \
    libssl \
    libutils \
    libaml_mp_sdk.vendor \
    libutilscallstack \
    libteec \
    libsystemcontrolservice \
    vendor.amlogic.hardware.systemcontrol@1.0 \
    vendor.amlogic.hardware.systemcontrol@1.1 \
    libfmq.vendor \
    libbinder_ndk \
    libhardware \
    libdtvkit_platform
ifeq ($(PRODUCT_SUPPORT_CCDATABASE), true)
    LOCAL_SHARED_LIBRARIES += libxds
endif
ifeq ($(DTVKIT_AIDL_ENABLE), true)
LOCAL_SHARED_LIBRARIES += \
    vendor.amlogic.hardware.dtvkitserver-V1-ndk
else
LOCAL_SHARED_LIBRARIES += \
    vendor.amlogic.hardware.dtvkitserver@1.0
endif
LOCAL_MODULE := atsc_server
LOCAL_SRC_FILES := atsc_server
LOCAL_LICENSE_KINDS := legacy_notice
LOCAL_LICENSE_CONDITIONS := notice
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MULTILIB := 32
include $(BUILD_PREBUILT)
endif

include $(call all-makefiles-under,$(LOCAL_PATH))
