#
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PACKAGE_OVERLAYS += device/htc/msm7x27-common/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# USB
PRODUCT_COPY_FILES += \
    device/htc/msm7x27-common/init.msm7x27.usb.rc:root/init.msm7x27.usb.rc

# Media
PRODUCT_COPY_FILES += \
    device/htc/msm7x27-common/libaudio/audio_policy.conf:system/etc/audio_policy.conf \
    device/htc/msm7x27-common/media_codecs.xml:system/etc/media_codecs.xml \
    device/htc/msm7x27-common/media_profiles.xml:system/etc/media_profiles.xml

# Common msm7x27 firmware
PRODUCT_COPY_FILES += \
    device/htc/msm7x27-common/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/msm7x27-common/firmware/fw_bcm4329.bin:system/etc/firmware/fw_bcm4329.bin \
    device/htc/msm7x27-common/firmware/fw_bcm4329_apsta.bin:system/etc/firmware/fw_bcm4329_apsta.bin

# Audio
PRODUCT_PACKAGES += \
    audio_policy.msm7x27 \
    audio.primary.msm7x27 \
    libtinyalsa

# Video
PRODUCT_PACKAGES += \
    libtilerenderer

# Camera
PRODUCT_PACKAGES += \
    camera.msm7x27

# Misc
PRODUCT_PACKAGES += \
    lights.msm7x27 \
    com.android.future.usb.accessory \
    brcm_patchram_plus \
    Superuser

### Add system daemons
PRODUCT_PACKAGES += \
    rild

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libhtc_ril.so \
    ro.ril.enable.dtm=1 \
    ro.ril.hsdpa.category=8 \
    ro.ril.hsupa.category=5 \
    ro.ril.def.agps.mode=2 \
    ro.ril.hsxpa=2 \
    ro.ril.gprsclass=12

# Interfaces
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=rmnet0,rmnet1,rmnet2,gprs,ppp0 \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160 \
    debug.sf.hw=1 \
    debug.composition.type=gpu

# Misc
PRODUCT_PROPERTY_OVERRIDES += \
    settings.display.brightness=143 \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    persist.sys.usb.config=mass_storage,adb \
    dalvik.vm.dexopt-data-only=1

# We have enough storage space to hold precise GC data
#PRODUCT_TAGS += dalvik.gc.type-precise

# Inherit qcom/msm7x27
$(call inherit-product, device/qcom/msm7x27/msm7x27.mk)

### Artwork
PRODUCT_LOCALES += mdpi

# Fall back to hdpi when mdpi is missing
PRODUCT_AAPT_CONFIG := normal mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Include Adreno200 vendor blobs
# http://git.cryptomilk.org/projects/marvel/android_vendor_qcom_msm7x27.git/
$(call inherit-product, vendor/qcom/msm7x27/qcom-vendor.mk)
