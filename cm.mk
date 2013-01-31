## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := Liberty

# Boot animation
TARGET_BOOTANIMATION_NAME := vertical-320x480

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/liberty/liberty.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := liberty
PRODUCT_NAME := cm_liberty
PRODUCT_BRAND := htc
PRODUCT_MODEL := Liberty
PRODUCT_MANUFACTURER := HTC
PRODUCT_VERSION_DEVICE_SPECIFIC := -UNOFFICIAL-BETA8
CM_RELEASE := true
