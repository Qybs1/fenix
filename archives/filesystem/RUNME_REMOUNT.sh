#!/bin/sh
#
# Commands for ROM release
#

sed -i "s/^# deb http/deb http/g" /etc/apt/sources.list

# Fetch the latest package lists from server
apt-get update

# Upgrade
apt-get -y --allow-unauthenticated upgrade

# Build the ramdisk
mkinitramfs -o /boot/initrd.img `cat linux-version` 2>/dev/null

# Generate uInitrd
mkimage -A arm64 -O linux -T ramdisk -a 0x0 -e 0x0 -n "initrd"  -d /boot/initrd.img  /boot/uInitrd

#Generate uImage
mkimage -n 'linux-4.9' -A arm64 -O linux -T kernel -C none -a 0x1080000 -e 0x1080000 -d /boot/Image /boot/uImage

# Restore the sources.list from mirrors to original
if [ -f /etc/apt/sources.list.orig ]; then
	mv /etc/apt/sources.list.orig /etc/apt/sources.list
fi

# Clean up
rm linux-version
apt clean
#history -c

# Self-deleting
rm $0
