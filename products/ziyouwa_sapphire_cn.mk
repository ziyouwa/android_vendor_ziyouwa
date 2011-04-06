# Inherit AOSP device configuration for dream_sapphire.
$(call inherit-product, device/htc/dream_sapphire/full_dream_sapphire.mk)
$(call inherit-product, device/common/gps/gps_as_supl.mk)
#Add Google software
CYANOGEN_WITH_GOOGLE := false

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/ziyouwa/products/common.mk)

# Include GSM-only stuff
$(call inherit-product, vendor/ziyouwa/products/gsm.mk)

PRODUCT_NAME := ziyouwa_sapphire
PRODUCT_BRAND := google
PRODUCT_DEVICE := dream_sapphire
PRODUCT_MODEL := Sapphire
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=GRI40 BUILD_DISPLAY_ID=GRI40 BUILD_FINGERPRINT=google/soju/crespo:2.3.3/GRI40/85442:user/release-keys PRIVATE_BUILD_DESC="soju-user 2.3.3 GRI40 85442 release-keys"

PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/ziyouwa/prelink-linux-arm-hero.map

NO_FALLBACK_FONT := false

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%m%d%Y)-NIGHTLY-DS-by-ziyouwa
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.0.0-RC0-Sapphire
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.0.0-RC0-Sapphire-YJ
    endif
endif

# Use the audio profile hack
WITH_DS_HTCACOUSTIC_HACK := true

# Extra DS overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/ziyouwa/overlay/dream_sapphire

# This file is used to install the correct audio profile when booted
PRODUCT_COPY_FILES += \
    vendor/ziyouwa/prebuilt/dream_sapphire/etc/init.d/02audio_profile:system/etc/init.d/02audio_profile

# Use Windows Media
#PRODUCT_SPECIFIC_DEFINES += WITH_WINDOWS_MEDIA=true

PRODUCT_PROPERTY_OVERRIDES +=	\
	ro.com.android.dateformat=yyyy-MM-dd	\
	persist.sys.timezone=Asia/Shanghai

PRODUCT_LOCALES := zh_CN en_US zh_TW

PRODUCT_COPY_FILES +=  \
    vendor/ziyouwa/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip	\
    vendor/cyanogen/prebuilt/dream_sapphire/etc/AudioPara_dream.csv:system/etc/AudioPara_dream.csv \
    vendor/cyanogen/prebuilt/dream_sapphire/etc/AudioPara_sapphire.csv:system/etc/AudioPara_sapphire.csv