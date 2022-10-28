# TWRP Device Tree for Samsung Galaxy J1 (J120H)

I used:

Ubuntu 18.04

openjdk-8-jdk

------

repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni -b twrp-7.1 --depth=1

repo sync -j4

git clone https://github.com/Gabriel2392/android_device_samsung_j1x3g device/samsung/j1x3g

. build/envsetup.sh

lunch omni_j1x3g-eng

make recoveryimage -j$(nproc --all)
