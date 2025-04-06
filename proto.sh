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
arch-chroot /mnt &&
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime &&
hwclock --systohc &&

# nano /etc/locale.gen [en_US.UTF-8 UTF-8] 
sed -i 's/^#\(en_US.UTF-8 UTF-8\)/\1/' /etc/locale.gen &&

locale-gen &&

# nano /etc/locale.conf [LANG=en_US.UTF-8]  
echo "LANG=en_US.UTF-8" >> /etc/locale.conf &&
# nano /etc/hostname 
echo "archlinux" >> /etc/hostname &&

passwd &&
useradd -m -G wheel -s /bin/bash testo &&
passwd testo &&

# EDITOR=nano visudo [wheel all=(all) nopasswd: all]  
sed -i 's/^#\("%wheel ALL=(ALL:ALL) ALL")/\1/' /etc/sudoers &&

systemctl enable NetworkManager &&
grub-install /dev/sda &&
grub-mkconfig -o /boot/grub/grub.cfg &&
umount -a 







