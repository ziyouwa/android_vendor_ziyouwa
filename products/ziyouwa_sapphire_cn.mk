$(call inherit-product-if-exists, vendor/htc/sapphire/device_sapphire_us-vendor.mk)
$(call inherit-product, vendor/ziyouwa/device_sapphire.mk)

#Add Google software
CYANOGEN_WITH_GOOGLE := true

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/ziyouwa/products/common.mk)

# Include GSM-only stuff
$(call inherit-product, vendor/ziyouwa/products/gsm.mk)

PRODUCT_NAME := ziyouwa_sapphire
PRODUCT_BRAND := google
PRODUCT_DEVICE := dream_sapphire
PRODUCT_MODEL := Sapphire
PRODUCT_MANUFACTURER := HTC

NO_FALLBACK_FONT := false

BOARD_KERNEL_BASE := 0x19200000
BOARD_VENDOR_QCOM_AMSS_VERSION := 6355

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=FRF91 BUILD_DISPLAY_ID=FRF91 BUILD_FINGERPRINT=google/passion/passion/mahimahi:2.2/FRF91/43546:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.2 FRF91 43546 release-keys"

PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/ziyouwa/prelink-linux-arm-ds.map

# Build kernel
PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-msm
PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=amss6355_defconfig

# Enable Compcache by default on D/S
PRODUCT_PROPERTY_OVERRIDES += \
    ro.compcache.default=1

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-6-$(shell date +%m%d%Y)-NIGHTLY-DS-by-ziyouwa
else
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod--$(shell date +%m%d%Y)-NIGHTLY-by-ziyouwa
endif

# Extra DS overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/ziyouwa/overlay/dream_sapphire

# Use the audio profile hack
WITH_DS_HTCACOUSTIC_HACK := true

# Use Windows Media
PRODUCT_SPECIFIC_DEFINES += WITH_WINDOWS_MEDIA=true

PRODUCT_PROPERTY_OVERRIDES +=	\
	ro.product.locale.language=zh	\
	ro.product.locale.region=CN	\
	ro.com.android.dateformat=yyyy-MM-dd	\
	persist.sys.timezone=Asia/Shanghai

PRODUCT_LOCALES := zh_CN en_US zh_TW

PRODUCT_PACKAGES += \
    PinyinIME
    
#Add support for audio+video recording on camera
PRODUCT_SPECIFIC_DEFINES += BUILD_WITH_FULL_STAGEFRIGHT=true
PRODUCT_PROPERTY_OVERRIDES += \
	media.stagefright.enable-record=true

PRODUCT_COPY_FILES +=  \
    vendor/ziyouwa/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip \
    vendor/ziyouwa/prebuilt/dream_sapphire/etc/init.d/02audio_profile:system/etc/init.d/02audio_profile \
    vendor/ziyouwa/prebuilt/dream_sapphire/etc/AudioPara_dream.csv:system/etc/AudioPara_dream.csv \
    vendor/ziyouwa/prebuilt/dream_sapphire/etc/AudioPara_sapphire.csv:system/etc/AudioPara_sapphire.csv

