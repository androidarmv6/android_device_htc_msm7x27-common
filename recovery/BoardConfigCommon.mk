BOARD_USES_MSM7X27_RECOVERY := true
BOARD_USES_MMCUTILS := false

TARGET_RECOVERY_INITRC = device/htc/msm7x27-common/recovery/init.htc.rc

BOARD_CUSTOM_GRAPHICS := ../../../device/htc/msm7x27-common/recovery/graphics.c

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_NO_MISC_PARTITION := true

BOARD_USE_CUSTOM_RECOVERY_FONT := \"font_7x16.h\"
BOARD_RECOVERY_HANDLES_MOUNT := true
BOARD_RECOVERY_SWIPE := true

TARGET_NO_SEPARATE_RECOVERY := true
TARGET_NO_INITLOGO := true
TARGET_RECOVERY_FSTAB := device/htc/msm7x27-common/recovery/recovery.fstab

# Use RGBX_8888 for TWRP only
ifeq ($(RECOVERY_VARIANT),twrp)
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
else
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
endif

TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"

TW_EXCLUDE_MTP := true
