#!/bin/bash -e

rm -rf Recovery.RO.dmg Recovery.RO.raw Recovery.dmg.sparseimage
hdiutil create -size 800m -layout "UNIVERSAL HD" -type SPARSE -o Recovery.dmg
newDevice=$(hdiutil attach -nomount Recovery.dmg.sparseimage | head -n 1 | awk  '{print $1}')
echo newdevice "$newDevice"
diskutil partitionDisk "${newDevice}" 1 MBR fat32 RECOVERY R
N=$(echo "$newDevice" | tr -dc '0-9')
diskutil mount disk"${N}"s1
MOUNT="$(diskutil info  disk"${N}"s1 | sed -n 's/.*Mount Point: *//p')"
mkdir -p "$MOUNT/com.apple.recovery.boot"
cp ./*.dmg ./*.chunklist "$MOUNT/com.apple.recovery.boot/"
diskutil umount disk"${N}"s1
hdiutil detach "$newDevice"
hdiutil convert -format UDZO Recovery.dmg.sparseimage -o Recovery.RO.dmg
rm Recovery.dmg.sparseimage
qemu-img convert -f dmg -O raw Recovery.RO.dmg Recovery.raw
rm Recovery.RO.dmg
