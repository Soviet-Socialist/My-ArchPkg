#!/bin/bash

# pause-funktion
function pause(){
 read -s -n 1 -p "Press any key to continue . . ."
 echo ""
}

echo mirrorlist editieren
nano /etc/pacman.d/mirrorlist

echo Benutzeroberfläche (XFCE4) und anderen wichtige Pakete  werden installiert
pacman -S --needed - < pkglist.txt
pause

echo Systemaktualisierung wird ausgefuehrt
pacman -Syy
pacman -Syu

echo es wird jetzt ein nutzer mit dem Namen rex erstellt
useradd -m -g users -s /bin/bash rex

echo Bitte ein Passwort für Rex festlegen
passwd rex

echo Damit der Benutzer auch Root-Rechte bekommt,
echo muss eine Konfiguration von sudo verändert werden
echo Suchen sie die folgende Zeile 
echo (steht unterhalb von "## Uncomment to allow members of group wheel to execute any command"):
echo
echo  # %wheel ALL=(ALL) ALL
echo
echo Entfernen sie das "#"
pause

EDITOR=nano visudo

echo rex wird wheel,audio,video hinzugefuegt
gpasswd -a duda wheel,video,audio

echo dienste werden aktiviert
systemctl enable lightdm
systemctl enable dhcpcd
systemctl enable iwd
pause

echo ================================Nachricht================================
echo 
echo .........Sie sind endgültig Fertig mit ihrer Installation!...............
echo .........Wenn sie gleich eine beliebige Taste druecken, wird der Display-
echo .........Manager gestartet und sie sind fertig!..........................
echo..........................................................................
echo .........GitHub: https://github.com/Soviet-Socialist/My-ArchPkg .........
echo
echo ========================================================================= 
pause
systemctl start lightdm
