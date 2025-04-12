#!/bin/bash

mkfs.ext4 /dev/vda3 &&
mkfs.fat -F 32 /dev/vda1 &&
mkswap /dev/vda2 &&
mount /dev/vda3 /mnt &&
mkdir -p /mnt/boot/efi &&
mount /dev/vda1 /mnt/boot/efi &&
swapon /dev/vda2 &&
pacstrap /mnt base linux-lts linux-firmware sof-firmware base-devel grub efibootmgr nano networkmanager sudo &&
genfstab /mnt &&
genfstab /mnt > /mnt/etc/fstab &&







