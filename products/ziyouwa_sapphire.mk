# Inherit AOSP device configuration for dream_sapphire.
$(call inherit-product, device/htc/dream_sapphire/full_dream_sapphire.mk)


# Inherit some common ziyouwamod stuff.
$(call inherit-product, vendor/ziyouwa/products/common.mk)

# Include GSM-only stuff
$(call inherit-product, vendor/ziyouwa/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := ziyouwa_sapphire
PRODUCT_BRAND := google
PRODUCT_DEVICE := sapphire
PRODUCT_MODEL := Sapphire
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=FRF91 BUILD_DISPLAY_ID=FRF91 BUILD_FINGERPRINT=google/passion/passion/mahimahi:2.2/FRF91/43546:user/release-keys
PRIVATE_BUILD_DESC="passion-user 2.2 FRF91 43546 release-keys"

PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/ziyouwa/prelink-linux-arm-ds.map

# Build kernel
PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-msm
PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=$(TARGET_KERNEL_DIR)/config-6.35v0.51

# Extra DS overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/ziyouwa/overlay/dream_sapphire

# This file is used to install the correct audio profile when booted
PRODUCT_COPY_FILES += \
    vendor/ziyouwa/prebuilt/dream_sapphire/etc/init.d/02audio_profile:system/etc/init.d/02audio_profile

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=ziyouwaMod-6-$(shell date +%m%d%Y)-NIGHTLY-DS
else
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod by ziyouwa
endif

# Use the audio profile hack
WITH_DS_HTCACOUSTIC_HACK := true

# Use Windows Media
WITH_WINDOWS_MEDIA := true

#
# Copy DS specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/ziyouwa/prebuilt/dream_sapphire/media/bootanimation.zip:system/media/bootanimation.zip \
    vendor/ziyouwa/prebuilt/dream_sapphire/etc/init.d/02audio_profile:system/etc/init.d/02audio_profile \
    vendor/ziyouwa/prebuilt/dream_sapphire/etc/AudioPara_dream.csv:system/etc/AudioPara_dream.csv \
    vendor/ziyouwa/prebuilt/dream_sapphire/etc/AudioPara_sapphire.csv:system/etc/AudioPara_sapphire.csv
