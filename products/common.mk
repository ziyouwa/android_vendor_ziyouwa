# Generic ziyouwamod product
PRODUCT_NAME := ziyouwa
PRODUCT_BRAND := ziyouwa
PRODUCT_DEVICE := generic

PRODUCT_PACKAGES += ADWLauncher

# Use edify for otapackage
PRODUCT_SPECIFIC_DEFINES += TARGET_OTA_SCRIPT_MODE=edify

# Include backuptool
PRODUCT_SPECIFIC_DEFINES += TARGET_OTA_BACKUPTOOL=true

# Display modversion in edify script.
PRODUCT_SPECIFIC_DEFINES += TARGET_OTA_MODVER=true

# Add ROMManager build property
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=DonMessWivIt.ogg
    ro.rommanager.developerid=cyanogenmode_by_ziyouwa


PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Used by BusyBox
KERNEL_MODULES_DIR:=/system/lib/modules

# Tiny toolbox
TINY_TOOLBOX:=true

# Enable Windows Media if supported by the board
WITH_WINDOWS_MEDIA:=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false	\
    ro.kernel.android.checkjni=0	\
    ro.setupwizard.mode=OPTIONAL

# CyanogenMod specific product packages
PRODUCT_PACKAGES += \
    CMParts \
    CMPartsHelper \
    CMWallpapers \
    DSPManager \
    Superuser

# Copy over the changelog to the device
#PRODUCT_COPY_FILES += \
#    vendor/ziyouwa/CHANGELOG.mkdn:system/etc/CHANGELOG-CM.txt

# Common CM overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/ziyouwa/overlay/common

# Bring in some audio files
include frameworks/base/data/sounds/AudioPackage4.mk

PRODUCT_COPY_FILES += \
    vendor/ziyouwa/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/ziyouwa/prebuilt/common/etc/mobile-conf.xml:system/etc/mobile-conf.xml \
    vendor/ziyouwa/prebuilt/common/etc/spn-conf.xml:system/etc/spn-conf.xml \
    vendor/ziyouwa/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf \
    vendor/ziyouwa/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/ziyouwa/prebuilt/common/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
    vendor/ziyouwa/prebuilt/common/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown \
    vendor/ziyouwa/prebuilt/common/etc/profile:system/etc/profile \
    vendor/ziyouwa/prebuilt/common/etc/init.local.rc:system/etc/init.local.rc \
    vendor/ziyouwa/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/ziyouwa/prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    vendor/ziyouwa/prebuilt/common/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    vendor/ziyouwa/prebuilt/common/etc/init.d/04modules:system/etc/init.d/04modules \
    vendor/ziyouwa/prebuilt/common/etc/init.d/20userinit:system/etc/init.d/20userinit \
    vendor/ziyouwa/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache \
    vendor/ziyouwa/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/ziyouwa/prebuilt/common/bin/fix_permissions:system/bin/fix_permissions \
    vendor/ziyouwa/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/ziyouwa/prebuilt/common/xbin/htop:system/xbin/htop \
    vendor/ziyouwa/prebuilt/common/xbin/irssi:system/xbin/irssi \
    vendor/ziyouwa/prebuilt/common/xbin/lsof:system/xbin/lsof \
    vendor/ziyouwa/prebuilt/common/xbin/powertop:system/xbin/powertop \
    vendor/ziyouwa/prebuilt/common/xbin/openvpn-up.sh:system/xbin/openvpn-up.sh

#PRODUCT_COPY_FILES += \
#    vendor/ziyouwa/prebuilt/common/etc/init.d/05mountsd:system/etc/init.d/05mountsd \
#    vendor/ziyouwa/prebuilt/common/etc/init.d/10apps2sd:system/etc/init.d/10apps2sd
 
#PRODUCT_COPY_FILES +=  \
#    vendor/ziyouwa/proprietary/RomManager.apk:system/app/RomManager.apk \

# Always run in insecure mode, enables root on user build variants
#ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0

ifdef CYANOGEN_WITH_GOOGLE
    PRODUCT_SPECIFIC_DEFINES += TARGET_OTA_BACKUPTOOL=false
#        vendor/ziyouwa/proprietary/CarHomeGoogle.apk:./system/app/CarHomeGoogle.apk \
#        vendor/ziyouwa/proprietary/CarHomeLauncher.apk:./system/app/CarHomeLauncher.apk \
#        vendor/ziyouwa/proprietary/Facebook.apk:./system/app/Facebook.apk \
#        vendor/ziyouwa/proprietary/LatinImeGoogle.apk:./system/app/LatinImeGoogle.apk \
#        vendor/ziyouwa/proprietary/LatinImeTutorial.apk:./system/app/LatinImeTutorial.apk \
#        vendor/ziyouwa/proprietary/Twitter.apk:./system/app/Twitter.apk \
#        vendor/ziyouwa/proprietary/YouTube.apk:./system/app/YouTube.apk \
#        vendor/ziyouwa/proprietary/Maps.apk:./system/app/Maps.apk \
#        vendor/ziyouwa/proprietary/Street.apk:./system/app/Street.apk \
#        vendor/ziyouwa/proprietary/com.amazon.mp3.apk:./system/app/com.amazon.mp3.apk 

 
    PRODUCT_COPY_FILES += \
       vendor/ziyouwa/proprietary/GenieWidget.apk:./system/app/GenieWidget.apk \
        vendor/ziyouwa/proprietary/Gmail.apk:./system/app/Gmail.apk \
        vendor/ziyouwa/proprietary/GoogleBackupTransport.apk:./system/app/GoogleBackupTransport.apk \
        vendor/ziyouwa/proprietary/GoogleCalendarSyncAdapter.apk:./system/app/GoogleCalendarSyncAdapter.apk \
        vendor/ziyouwa/proprietary/GoogleContactsSyncAdapter.apk:./system/app/GoogleContactsSyncAdapter.apk \
        vendor/ziyouwa/proprietary/GoogleFeedback.apk:./system/app/GoogleFeedback.apk \
        vendor/ziyouwa/proprietary/GooglePartnerSetup.apk:./system/app/GooglePartnerSetup.apk \
        vendor/ziyouwa/proprietary/GoogleQuickSearchBox.apk:./system/app/GoogleQuickSearchBox.apk \
        vendor/ziyouwa/proprietary/GoogleServicesFramework.apk:./system/app/GoogleServicesFramework.apk \
        vendor/ziyouwa/proprietary/HtcCopyright.apk:./system/app/HtcCopyright.apk \
        vendor/ziyouwa/proprietary/HtcEmailPolicy.apk:./system/app/HtcEmailPolicy.apk \
        vendor/ziyouwa/proprietary/HtcSettings.apk:./system/app/HtcSettings.apk \
        vendor/ziyouwa/proprietary/MarketUpdater.apk:./system/app/MarketUpdater.apk \
        vendor/ziyouwa/proprietary/MediaUploader.apk:./system/app/MediaUploader.apk \
        vendor/ziyouwa/proprietary/NetworkLocation.apk:./system/app/NetworkLocation.apk \
        vendor/ziyouwa/proprietary/OneTimeInitializer.apk:./system/app/OneTimeInitializer.apk \
        vendor/ziyouwa/proprietary/PassionQuickOffice.apk:./system/app/PassionQuickOffice.apk \
        vendor/ziyouwa/proprietary/SetupWizard.apk:./system/app/SetupWizard.apk \
        vendor/ziyouwa/proprietary/Talk.apk:./system/app/Talk.apk \
        vendor/ziyouwa/proprietary/Vending.apk:./system/app/Vending.apk \
        vendor/ziyouwa/proprietary/VoiceSearch.apk:./system/app/VoiceSearch.apk \
        vendor/ziyouwa/proprietary/googlevoice.apk:./system/app/googlevoice.apk \
        vendor/ziyouwa/proprietary/kickback.apk:./system/app/kickback.apk \
        vendor/ziyouwa/proprietary/soundback.apk:./system/app/soundback.apk \
        vendor/ziyouwa/proprietary/talkback.apk:./system/app/talkback.apk \
        vendor/ziyouwa/proprietary/com.google.android.maps.xml:./system/etc/permissions/com.google.android.maps.xml \
        vendor/ziyouwa/proprietary/features.xml:./system/etc/permissions/features.xml \
        vendor/ziyouwa/proprietary/com.google.android.maps.jar:./system/framework/com.google.android.maps.jar \
        vendor/ziyouwa/proprietary/libinterstitial.so:./system/lib/libinterstitial.so \
        vendor/ziyouwa/proprietary/libspeech.so:./system/lib/libspeech.so
else
    PRODUCT_PACKAGES += \
        Provision \
        GoogleSearch \
        LatinIME
endif
