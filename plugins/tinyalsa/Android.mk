ifeq ($(call is-board-platform-in-list, sdm845 msmnile kona lahaina taro bengal),true)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_C_INCLUDES += $(TOP)/vendor/qcom/opensource/tinyalsa/include
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/include/mm-audio/
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/include/mm-audio/ar/ar_osal

LOCAL_HEADER_LIBRARIES := libagm_headers
LOCAL_HEADER_LIBRARIES += libarosal_headers

LOCAL_SRC_FILES := src/agm_pcm_plugin.c

LOCAL_MODULE := libagm_pcm_plugin
LOCAL_MODULE_OWNER         := qti
LOCAL_MODULE_TAGS := optional

LOCAL_SHARED_LIBRARIES := \
        libqti-tinyalsa \
        libsndcardparser \
        libagmclient \
        libutils \
        libcutils \
        liblog

LOCAL_VENDOR_MODULE := true
LOCAL_CFLAGS += -Wall

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_DYNAMIC_LOG)), true)
LOCAL_CFLAGS += -DDYNAMIC_LOG_ENABLED
LOCAL_C_INCLUDES += $(TOP)/external/expat/lib/expat.h
LOCAL_SHARED_LIBRARIES += libaudio_log_utils \
                          libexpat
LOCAL_HEADER_LIBRARIES += libaudiologutils_headers
endif

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_C_INCLUDES += $(TOP)/vendor/qcom/opensource/tinyalsa/include
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/include/mm-audio/
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/include/mm-audio/ar/ar_osal

LOCAL_HEADER_LIBRARIES := libagm_headers
LOCAL_HEADER_LIBRARIES += libarosal_headers

LOCAL_SRC_FILES := src/agm_mixer_plugin.c

LOCAL_MODULE := libagm_mixer_plugin
LOCAL_MODULE_OWNER         := qti
LOCAL_MODULE_TAGS := optional

LOCAL_SHARED_LIBRARIES := \
        libqti-tinyalsa \
        libsndcardparser \
        libagmclient \
        libcutils \
        libutils \
        liblog

LOCAL_VENDOR_MODULE := true

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_DYNAMIC_LOG)), true)
LOCAL_CFLAGS += -DDYNAMIC_LOG_ENABLED
LOCAL_C_INCLUDES += $(TOP)/external/expat/lib/expat.h
LOCAL_SHARED_LIBRARIES += libaudio_log_utils \
                          libexpat
LOCAL_HEADER_LIBRARIES += libaudiologutils_headers
endif

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_C_INCLUDES += $(TOP)/vendor/qcom/opensource/tinyalsa/include
LOCAL_C_INCLUDES += $(TOP)/vendor/qcom/opensource/tinycompress/include
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/include/mm-audio/
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/include/mm-audio/ar/ar_osal

LOCAL_ADDITIONAL_DEPENDENCIES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
LOCAL_HEADER_LIBRARIES := libagm_headers
LOCAL_HEADER_LIBRARIES += libarosal_headers

LOCAL_SRC_FILES := src/agm_compress_plugin.c

LOCAL_MODULE := libagm_compress_plugin
LOCAL_MODULE_OWNER         := qti
LOCAL_MODULE_TAGS := optional

LOCAL_SHARED_LIBRARIES := \
        libqti-tinyalsa \
        libqti-tinycompress \
        libsndcardparser \
        libagmclient \
        libutils \
        libcutils \
        liblog

LOCAL_VENDOR_MODULE := true

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_DYNAMIC_LOG)), true)
LOCAL_CFLAGS += -DDYNAMIC_LOG_ENABLED
LOCAL_C_INCLUDES += $(TOP)/external/expat/lib/expat.h
LOCAL_SHARED_LIBRARIES += libaudio_log_utils \
                          libexpat
LOCAL_HEADER_LIBRARIES += libaudiologutils_headers
endif

include $(BUILD_SHARED_LIBRARY)

endif
