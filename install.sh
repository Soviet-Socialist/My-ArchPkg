#!/bin/bash

function pause(){
 read -s -n 1 -p "Press any key to continue . . ."
 echo ""
}

echo running...
loadkeys de-latin1
echo cfdisk formatierung vornehmen
echo /dev/sda1 MUSS root sein
pause
cfdisk
pause
echo Partition wird formatiert und gemounted
mkfs.btrfs /dev/sda1
mount /dev/sda1 /mnt

echo basis wird installiert
pacstrap /mnt base base-devel linux linux-firmware dhcpcd nano iwd
pause

echo fstab wird generiert
genfstab -U /mnt > /mnt/etc/fstab
pause 

cd ..
cp -r ./My-ArchPkg /mnt
clear
echo jetzt /My-ArchPkg/arch-chroot.sh IN ARCH-CHROOT starten
pause
