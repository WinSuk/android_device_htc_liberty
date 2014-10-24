## Specify phone tech before including mini_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := Liberty

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/liberty/liberty.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := liberty
PRODUCT_NAME := cm_liberty
PRODUCT_BRAND := htc
PRODUCT_MODEL := Liberty
PRODUCT_MANUFACTURER := HTC
