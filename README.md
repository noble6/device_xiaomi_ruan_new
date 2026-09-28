# device/xiaomi/ruan

Redmi Pad Pro 5G / POCO Pad 5G (`ruan`), Evolution X 16 (bka).

ruan is dizi (the Wi-Fi model) with a modem and GNSS. The stock ROMs share the
kernel, the modules (identical code) and the base dtbs; the full comparison is in
`research/ruan.md` in the bring-up repo. This tree therefore only adds the
modem side on top of `device/xiaomi/dizi`:

* `BoardConfig.mk` includes dizi's with `DIZI_VENDOR := ruan`, and swaps in the
  ruan stock `dtbo.img` (the dizi ROM's ruan entry has no camera nodes).
* `device.mk` inherits dizi's with `DIZI_TELEPHONY := true` (keeps the telephony
  features) and `DIZI_VENDOR := ruan` (vendor/xiaomi/ruan blobs), and adds
  the QTI telephony packages, overlays, GNSS feature and `init.ruan.rc`.
* `configs/hidl/manifest_ruan.xml`: modem HALs from the stock ruan ODM manifest
  (identical for all ruan SKUs) that neither dizi nor the vendor fragments declare.
* `proprietary-files.txt`: `gen-blobs.py --telephony` over the ruan dump; every
  blob comes from ruan `OS3.0.303.0.WFSMIXM`, including those shared with dizi.

Blobs: `python3 tools/gen-blobs.py --telephony --source='ruan_global OS3.0.303.0.WFSMIXM'
trees/ref/evox_garnet/proprietary-files.txt stock/ruan/dump evox > evox/device/xiaomi/ruan/proprietary-files.txt`,
then in `evox/`: `PYTHONPATH=$PWD/tools/extract-utils ANDROID_BUILD_TOP=$PWD python3
device/xiaomi/ruan/extract-files.py /build/alex/dizi/stock/ruan/dump`.

Build: `DEVICE=ruan tools/build.sh <log-name>`.
