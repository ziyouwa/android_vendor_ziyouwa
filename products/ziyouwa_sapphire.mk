# Inherit AOSP device configuration for dream_sapphire.
#$(call inherit-product, device/htc/dream_sapphire/full_dream_sapphire.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_as_supl.mk)

DEVICE_PACKAGE_OVERLAYS := device/htc/dream_sapphire/overlay

PRODUCT_PACKAGES += \
    VoiceDialer \
    sensors.msm7k \
    PinyinIME

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=yyyy-MM-dd \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.media.dec.jpeg.memcap=10000000

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libhtc_ril.so \
    wifi.interface=tiwlan0

# Time between scans in seconds. Keep it high to minimize battery drain.
# This only affects the case in which there are remembered access points,
# but none are in range.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.supplicant_scan_interval=15

# density in DPI of the LCD of this board. This is used to scale the UI
# appropriately. If this property is not defined, the default value is 160 dpi. 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160

# Default network type
# 0 => WCDMA Preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0

# media configuration xml file
PRODUCT_COPY_FILES += \
    device/htc/dream_sapphire/media_profiles.xml:/system/etc/media_profiles.xml

## (2) Also get non-open-source aspects if available
$(call inherit-product-if-exists, vendor/htc/dream_sapphire/dream_sapphire-vendor.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/generic.mk)

        
# Inherit some common ziyouwamod stuff.
$(call inherit-product, vendor/ziyouwa/products/common.mk)

# Include GSM-only stuff
$(call inherit-product, vendor/ziyouwa/products/gsm.mk)


#
# Setup device specific product configuration.
#
PRODUCT_NAME := ziyouwa_sapphire
PRODUCT_BRAND := google
PRODUCT_DEVICE := dream_sapphire
PRODUCT_MODEL := Sapphire
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=FRF91 BUILD_DISPLAY_ID=FRF91 BUILD_FINGERPRINT=google/passion/passion/mahimahi:2.2/FRF91/43546:user/release-keys
PRIVATE_BUILD_DESC="passion-user 2.2 FRF91 43546 release-keys"

PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/ziyouwa/prelink-linux-arm-ds.map


#Add support for audio+video recording on camera
BUILD_WITH_FULL_STAGEFRIGHT := true
PRODUCT_PROPERTY_OVERRIDES += \
	media.stagefright.enable-record=true

#some property for me
PRODUCT_PROPERTY_OVERRIDES += \
	ro.product.locale.language=zh	\
	ro.product.locale.region=CN	\
	ro.build.display.id=CyanogenMod_by_Ziyouwa


#Add Google software
PRODUCT_SPECIFIC_DEFINES += CYANOGEN_WITH_GOOGLE=true

PRODUCT_COPY_FILES +=  \
	vendor/ziyouwa/proprietary/features.xml:system/etc/permissions/features.xml	\
	vendor/ziyouwa/proprietary/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml	\
	vendor/ziyouwa/proprietary/com.google.android.maps.jar:system/framework/com.google.android.maps.jar

# Build kernel
PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-msm
PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=$(TOP)/config-6.35

# Extra DS overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/ziyouwa/overlay/dream_sapphire

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=ziyouwaMod-6-$(shell date +%m%d%Y)-NIGHTLY-DS
else
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-by-ziyouwa
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
    
PRODUCT_LOCALES := zh_CN en_US zh_TW

# dev:    size   erasesize  name
# mtd0: 00040000 00020000 "misc"
# mtd1: 00500000 00020000 "recovery"
# mtd2: 00280000 00020000 "boot"
# mtd3: 05a00000 00020000 "system"
# mtd4: 05000000 00020000 "cache"
# mtd5: 127c0000 00020000 "userdata"
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00280000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0aa00000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0a5c0000
BOARD_VENDOR_QCOM_AMSS_VERSION := 6355
BOARD_KERNEL_BASE := 19200000

PRODUCT_PACKAGES += \
	PinyinIME


# Enable JIT by default
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.execution-mode=int:jit
WITH_JIT := true
ENABLE_JSC_JIT := true

# Use libcamera2
USE_CAMERA_STUB := false
BOARD_USES_OLD_CAMERA_HACK := true
