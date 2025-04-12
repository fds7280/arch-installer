#!/bin/bash


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
useradd -m -G wheel -s /bin/bash prin &&
passwd prin &&

# EDITOR=nano visudo [wheel all=(all) nopasswd: all]  
sed -i 's/^#\s*\(%wheel ALL=(ALL:ALL) ALL\)/\1/' /etc/sudoers

systemctl enable NetworkManager &&
grub-install /dev/sda &&
grub-mkconfig -o /boot/grub/grub.cfg &&
umount -a 
