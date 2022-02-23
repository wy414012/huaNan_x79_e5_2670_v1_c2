#!/bin/bash

hdiutil create -o /tmp/Monterey.cdr -size 16G -layout SPUD -fs HFS+J

hdiutil attach /tmp/Monterey.cdr.dmg -noverify -mountpoint /Volumes/install_build

sudo /Applications/"Install macOS Monterey.app"/Contents/Resources/createinstallmedia --volume /Volumes/install_build

hdiutil detach "/Volumes/Install macOS Monterey"

mv /tmp/Monterey.cdr.dmg ~/Desktop/InstallSystem.dmg

hdiutil convert ~/Desktop/InstallSystem.dmg -format UDTO -o ~/Desktop/Monterey.iso

cd ~/Desktop/

mv Monterey.iso.cdr Install_macOS_Monterey.iso
