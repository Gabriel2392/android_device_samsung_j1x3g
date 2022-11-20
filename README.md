# TWRP Device Tree for Samsung Galaxy J1 (J120H)

## Sync:

```sh
repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni -b twrp-7.1 --depth=1
repo sync -j$(nproc --all)
```

## Build:

```sh
. build/envsetup.sh
lunch omni_j1x3g-eng
make recoveryimage -j$(nproc --all)
```
