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

-include device/qcom/msm7x27/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/htc/msm7x27-common/include

# Make sure this folder exists so display stuff doesn't fail
$(shell mkdir -p $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/)

# inherit from common msm7x27 Recovery
-include device/htc/msm7x27-common/recovery/BoardConfigCommon.mk

TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_PROVIDES_LIBLIGHT := true

### Kernel
TARGET_KERNEL_SOURCE := kernel/htc/msm7x27
MINIGZIP := $(shell which lzma)

### USB Mass Storage
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file

### Wifi related defines
USE_LEGACY_SOFTAP                := true
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WLAN_DEVICE                := bcm4329
BOARD_WPA_SUPPLICANT_DRIVER      := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/system/etc/firmware/fw_bcm4329.bin nvram_path=/proc/calibration iface_name=wlan0"
WIFI_DRIVER_MODULE_NAME          := "bcm4329"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/firmware/fw_bcm4329_apsta.bin"
#WIFI_DRIVER_FW_PATH_PARAM       := "/sys/module/bcm4329/parameters/firmware_path"
BOARD_WLAN_DEVICE_REV            := bcm4329
WIFI_BAND                        := 802_11_ABG

### Graphics
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60 -DQCOM_MISSING_PIXEL_FORMATS
TARGET_USES_C2D_COMPOSITION := false
TARGET_USES_SF_BYPASS := false
TARGET_HAVE_BYPASS := false
TARGET_USES_OVERLAY := false
TARGET_QCOM_HDMI_OUT := false
TARGET_GRALLOC_USES_ASHMEM := false
TARGET_USES_GENLOCK := true
TARGET_NO_HW_VSYNC := true
TARGET_USES_HWC_FENCE_SYNC := true

#TARGET_DISABLE_TRIPLE_BUFFERING := true

### Camera
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true
#BOARD_USES_LEGACY_CAMERA := true
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT -DNEEDS_VECTORIMPL_SYMBOLS

### Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_PREBUILT_LIBAUDIO := false
BOARD_USES_QCOM_AUDIO_VOIPMUTE := true
BOARD_USES_QCOM_AUDIO_RESETALL := true

### Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
#BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := false
BOARD_BLUEDROID_VENDOR_CONF := device/htc/msm7x27-common/bluetooth/btvendor_7x27.txt

### FM radio
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

BOARD_VENDOR_QCOM_AMSS_VERSION := 4735

### Boot animation
TARGET_BOOTANIMATION_USE_RGB565 := true

### QCOM
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_USE_QCOM_PMEM := true

BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 20000

## Override healthd HAL
BOARD_HAL_STATIC_LIBRARIES := libhealthd.msm7x27

### RIL
BOARD_USES_LEGACY_RIL := true
BOARD_USE_NEW_LIBRIL_HTC := true

### SELinux
BOARD_SEPOLICY_DIRS += device/htc/msm7x27-common/sepolicy
BOARD_SEPOLICY_UNION += \
    file_contexts

### Browser
ENABLE_WEBGL := true

## OTA script extras file (build/tools/releasetools)
TARGET_OTA_EXTRAS_FILE := device/htc/msm7x27-common/releasetools/extras.txt

## TEMPORARY HACK: skip building external/chromium_org/
PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes
