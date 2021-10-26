# TWRP Device Tree for Samsung Galaxy J1 (J120H)

I used:

Ubuntu 18.04

openjdk-8-jdk

------

repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni -b twrp-5.1 --depth=1

repo sync -j4

------
clone this repo to device/samsung/j1x3g using git clone
------

. build/envsetup.sh

lunch omni_j1x3g-eng

make recoveryimage -j$(nproc --all)
