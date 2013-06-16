#
# Copyright (C) 2012 The Android Open Source Project
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


DEVICE_PACKAGE_OVERLAYS += device/htc/liberty/overlay

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/liberty/prebuilt/usr/keylayout/liberty-keypad.kl:system/usr/keylayout/liberty-keypad.kl \
    device/htc/liberty/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/liberty/prebuilt/usr/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl \
    device/htc/liberty/prebuilt/usr/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl

# Input device calibration files
PRODUCT_COPY_FILES += \
    device/htc/liberty/prebuilt/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/liberty/prebuilt/usr/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/liberty/prebuilt/usr/idc/curcial-oj.idc:system/usr/idc/curcial-oj.idc

PRODUCT_COPY_FILES += \
    device/htc/liberty/init.liberty.rc:root/init.liberty.rc \
    device/htc/liberty/ueventd.liberty.rc:root/ueventd.liberty.rc

# Default network type.
# 0 => WCDMA preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0 \
    ro.telephony.ril.v3=signalstrength

# This is a 512MB device, so 32mb heapsize
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=32m

## Get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/liberty/liberty-vendor.mk)

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

PRODUCT_PACKAGES += \
    gps.liberty \
    sensors.liberty

PRODUCT_COPY_FILES += \
    device/htc/liberty/vold.fstab:system/etc/vold.fstab \
    device/common/gps/gps.conf_US:system/etc/gps.conf \
    vendor/cm/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/htc/liberty/prebuilt/bin/trackballwake:system/bin/trackballwake \
    device/htc/liberty/prebuilt/etc/init.d/05mountsd:system/etc/init.d/05mountsd \
    device/htc/liberty/prebuilt/lib/libcamera.so:system/lib/libcamera.so \
    system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf

# Extra live wallpapers
PRODUCT_PACKAGES += \
    HoloSpiralWallpaper \
    NoiseField \
    Galaxy4 \
    PhaseBeam

# Copy prebuilt wifi module when it isn't being built with the kernel
ifeq ($(FULL_KERNEL_BUILD),false)
PRODUCT_COPY_FILES += \
    device/htc/liberty/prebuilt/lib/modules/bcm4329.ko:system/lib/modules/bcm4329.ko
endif

# media profiles and capabilities spec
$(call inherit-product, device/htc/liberty/media_a1026.mk)

# Sets copy files for all HTC-specific device
PRODUCT_COPY_FILES += device/htc/liberty/prebuilt/etc/ecclist_for_mcc.conf:system/etc/ecclist_for_mcc.conf

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES += \
    device/htc/liberty/prebuilt/lib/libcamera.so:obj/lib/libcamera.so

# inherit from common msm7x27
$(call inherit-product, device/htc/msm7x27-common/msm7x27.mk)

$(call inherit-product, build/target/product/full_base_telephony.mk)

PRODUCT_NAME := generic_liberty
PRODUCT_MANUFACTURER := HTC
PRODUCT_DEVICE := liberty
