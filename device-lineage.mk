#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Scudo
PRODUCT_USE_SCUDO := true

# Disable Artifact Requirements
DISABLE_ARTIFACT_PATH_REQUIREMENTS := true

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage

# ANGLE - Almost Native Graphics Layer Engine
PRODUCT_PACKAGES += \
    ANGLE

# EUICC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.xml

PRODUCT_PACKAGES += \
    EuiccSupportPixelOverlay

# Kernel
TARGET_PREBUILT_KERNEL := device/google/lynx-kernel/Image.lz4

# wireless_charger HAL service
include device/google/gs-common/wireless_charger/wireless_charger.mk

# Face Unlock
include vendor/google/faceunlock/device.mk

# PixelParts
include packages/apps/PixelParts/device.mk

# PowerShare
include hardware/google/pixel/powershare/device.mk

# Build necessary packages for vendor

# Sigma Flags
SIGMA_BUILD_TYPE := OFFICIAL
SIGMA_MAINTAINER := EliteDarkKaiser
TARGET_HAS_UDFPS := true
TARGET_ENABLE_BLUR := true
TARGET_IS_PIXEL := true
TARGET_SUPPORTS_CLEAR_CALLING := true

# Gapps
WITH_GMS := true
WITH_GAPPS := true
BUILD_GMS_OVERLAYS_AND_PROPS := true
TARGET_INCLUDE_PIXEL_LAUNCHER := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_SUPPORTS_CALL_RECORDING := true


# Codec2
PRODUCT_PACKAGES += \
    libacryl \
    libacryl_hdr_plugin \
    libexynosv4l2

# Fingerprint
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# Graphics
PRODUCT_PACKAGES += \
    libEGL_angle \
    libGLESv1_CM_angle \
    libGLESv2_angle

# Identity credential
PRODUCT_PACKAGES += \
    android.hardware.identity_credential.xml

# Sensors
PRODUCT_PACKAGES += \
    sensors.dynamic_sensor_hal

# Wi-Fi
PRODUCT_PACKAGES += \
    libwifi-hal-ctrl:64

# Properties
TARGET_VENDOR_PROP := $(LOCAL_PATH)/vendor.prop
