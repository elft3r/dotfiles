#!/bin/bash
#
# switch the NTFS from the macOS default to the NFTS-3G version
mv /Volumes/elft3r-disk/sbin/mount_ntfs /Volumes/elft3r-disk/sbin/mount_ntfs.orig
ln -s /Volumes/elft3r-disk/usr/local/sbin/mount_ntfs /Volumes/elft3r-disk/sbin/mount_ntfs
