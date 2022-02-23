#!/bin/bash

function pause(){
 read -s -n 1 -p "Press any key to continue . . ."
 echo ""
}

echo /etc wird konfiguriert
echo

echo hostname wird generiert
echo arch-system > /etc/hostname

echo locale.conf wird generiert
echo LANG=de_DE.UTF-8 > /etc/locale.conf

echo locale.gen wird generiert
echo de_DE.UTF-8 UTF-8 > /etc/locale.gen
echo de_DE ISO-8859-1 >> /etc/locale.gen
echo de_DE@euro ISO-8859-15 >> /etc/locale.gen

echo locale-gen wird ausgeführt
locale-gen
echo 
echo vconsole.conf wird generiert
echo KEYMAP=de-latin1 > /etc/vconsole.conf
echo FONT=lat9w-16 >> /etc/vconsole.conf

echo localetime wird generiert
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
echo
echo hosts wird generiert
echo 127.0.0.1	localhost.localdomain	localhost >> /etc/hostname
echo ::1	localhost.localdomain	localhost >> /etc/hostname

echo /etc konfiguration ist fertig
pause
echo

echo bitte legen sie ein root Passwort fest
passwd root
echo 
echo syslinux wird installiert
pacman -S gptfdisk syslinux
echo Bitte folgende ausgabe beachten WICHTIG!!!!!

echo If you want to use syslinux as your bootloader
echo edit /boot/syslinux/syslinux.cfg and run
echo /usr/sbin/syslinux-install_update -i -a -m
echo to install it.
pause

echo bitte Syslinux configurieren
echo wo /dev/sda3 steht /dev/sda1 hinschreiben
pause
nano /boot/syslinux/syslinux.cfg

echo syslinux Einstellungen werden übernommen
syslinux-install_update -iam

echo ===============================NACHRICHT======================================
echo
echo HERZLICHEN GLÜCKWUNSCH! DAS GRUNDSYSTEM IST INSTALLIERT!
echo sie können nun arch-chroot beenden und neu starten! 
echo Nach einloggen ins root konto bitte /My-ArchPkg/after-install.sh ausführen.
echo
echo ==============================================================================
pause
