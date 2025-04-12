#!/bin/bash

mkfs.ext4 /dev/sda3 &&
mkfs.fat -F 32 /dev/sda1 &&
mkswap /dev/sda2 &&
mount /dev/sda3 /mnt &&
mkdir -p /mnt/boot/efi &&
mount /dev/sda1 /mnt/boot/efi &&
swapon /dev/sda2 &&
pacstrap /mnt base linux-lts linux-firmware sof-firmware base-devel grub efibootmgr nano networkmanager sudo &&
genfstab /mnt &&
genfstab /mnt > /mnt/etc/fstab 






