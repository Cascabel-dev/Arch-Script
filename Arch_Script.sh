#!/bin/bash

if (whiptail --yesno "This script takes an extreme approach to debloating a minimal installation of GNOME 3 on Arch Linux, and it may break some functionality.  Select \"Debloat\" to continue, or \"Cancel\" to quit." --yes-button "Debloat" --no-button "Cancel" 10 60);
then
	yes | sudo pacman -Syyy && yes | sudo pacman -Syu && yes | sudo pacman -Rns $(pacman -Qdtq) && yes | sudo pacman -Rns gnome-books gnome-boxes gnome-calculator gnome-calendar gnome-clocks gnome-contacts simple-scan gnome-documents gnome-maps gnome-music gnome-software gnome-logs evince sushi gnome-weather epiphany automake baobab bison eog flex gnome-font-viewer gnome-getting-started-docs gnome-shell-extensions gnome-system-monitor gnome-user-docs orca vino which
else
	exit
fi

CHOICES=$(whiptail --title "Install apps" --yes-button "Install" --no-button "Cancel" --separate-output --checklist "Choose apps you'd like this script to install (Deselect all options if you'd like to skip this step.):" 21 86 12 \
"Ungoogled-Chromium" "(Web Browser) - BINARY" OFF \
"Yay" "(AUR Helper)" OFF \
"Trizen" "(AUR Helper) - Better security, less features." OFF \
"neofetch" "(System Information Tool)" OFF \
"Lutris" "(FOSS Game Manager)" OFF \
"Ghostwriter" "(Text Editor)" OFF \
"Element" "(Matrix Client) - REQUIRES YAY" OFF \
"LibreOffice" "(Office Suite)" OFF \
"GIMP" "(Image Editor)" OFF \
"Audacity" "(Audio Editor)" OFF \
"Thunderbird" "(Email Client)" OFF \
"OBS" "(Screen Recorder)" OFF \
"htop" "(CLI Resource Monitoring Tool)" OFF \
"Timeshift" "(System Backup and Restore Software) - REQUIRES YAY" OFF \
"VSCodium" "(FOSS Version of VSCode, a Code Editor)" OFF \
"VLC" "(Media Player)" OFF \
"MPV" "(Alternative Media Player, Lighter Than VLC)" OFF \
"ClamAV" "(FOSS Anti-Virus Software)" OFF \
"VeraCrypt" "(Encryption Software)" OFF \
"Bitwarden" "(Popular Online Open-Source Password Manager)" OFF \
"KeePass" "(Popular Offline Open-Source Password Manager)" OFF \
"BleachBit" "(Data Cleaning and File Shredding tool)" OFF \
"virt-manager" "(Virtual Machine Monitor & Manager)" OFF 3>&1 1>&2 2>&3)
        
if [ -z "$CHOICE" ]; then
  for CHOICE in $CHOICES; do
    case "$CHOICE" in
    "Ungoogled-Chromium")
      cd ~/Downloads && wget https://github.com/mdedonno1337/ungoogled-chromium-binaries/releases/download/91.0.4472.77-1.1/ungoogled-chromium_91.0.4472.77-1.1.AppImage && touch ugcsig.md5sum && touch ugcsig.sha1sum && touch ugcsig.sha256sum && echo "c9b14a7f025e4754ddbe9b2d8ccb8751	ungoogled-chromium_91.0.4472.77-1.1.AppImage" >> ugcsig.md5sum && echo "d84d936b9b053cc1afcf104edb3efbb3ba471f7e	ungoogled-chromium_91.0.4472.77-1.1.AppImage" >> ugcsig.sha1sum && echo "7e40d7ee2830c99af1f4ff295cc0a94561ddebad1567c8d24251906769a90677	ungoogled-chromium_91.0.4472.77-1.1.AppImage" >> ugcsig.sha256sum && 
md5sum -c ugcsig.md5sum | grep FAILED && echo "Installation of Ungoogled Chromium could not be completed due to an invalid MD5 signature." >> errorlog.txt && sudo rm -rf ~/Downloads/ungoogled-chromium_91.0.4472.77-1.1.AppImage
sha1sum -c ugcsig.sha1sum | grep FAILED && echo "Installation of Ungoogled Chromium could not be completed due to an invalid SHA1 signature." >> errorlog.txt && sudo rm -rf ~/Downloads/ungoogled-chromium_91.0.4472.77-1.1.AppImage
sha256sum -c ugcsig.sha256sum | grep FAILED && echo "Installation of Ungoogled Chromium could not be completed due to an invalid SHA256 signature." >> errorlog.txt && sudo rm -rf ~/Downloads/ungoogled-chromium_91.0.4472.77-1.1.AppImage
sudo rm -rf ugcsig.md5sum ugcsig.sha1sum ugcsig.sha256sum
      ;;
    "Yay")
      sudo pacman --noconfirm -S git base-devel
      mkdir ~/Downloads/git || true
      cd ~/Downloads/git && git clone https://aur.archlinux.org/yay.git && cd ~/Downloads/git/yay && yes | makepkg -si && sleep 1 && cd ~/Downloads/git && sudo rm -rf yay/
      ;;
    "Trizen")
      sudo pacman --noconfirm -S git base-devel
      mkdir ~/Downloads/git || true
      cd ~/Downloads/git && git clone https://aur.archlinux.org/trizen.git && cd ~/Downloads/git/trizen && yes | makepkg -si && sleep 1 && cd ~/Downloads/git && sudo rm -rf trizen/
      ;;
    "neofetch")
      yes | sudo pacman -S neofetch
      ;;
    "Lutris")
      yes | sudo pacman -S lutris
      ;;
    "Ghostwriter")
      sudo pacman --noconfirm -S ghostwriter
      ;;
    "Element")
      yes | yay -S element-desktop
      ;;
    "LibreOffice")
      yes | sudo pacman -S libreoffice-fresh
      ;;
    "GIMP")
      yes | sudo pacman -S gimp
      ;;
    "Audacity")
      yes | sudo pacman -S audacity
      ;;
    "Thunderbird")
      sudo pacman --noconfirm -S thunderbird
      ;;
    "OBS")
      yes | sudo pacman -S obs-studio
      ;;
    "htop")
      yes | sudo pacman -S htop
      ;;
    "Timeshift")
      mkdir ~/Downloads/git || true
      cd ~/Downloads/git && git clone https://aur.archlinux.org/timeshift.git && cd timeshift/ && yes | makepkg -sri sleep 1 && cd ~/Downloads/git && rm -rf timeshift/
      ;;
    "VSCodium")
      yay --noconfirm -Syu vscodium-bin 
      ;;
    "VLC")
      yes | sudo pacman -S vlc
      ;;
    "MPV")
      yes | sudo pacman -S vlc
      ;;
    "ClamAV")
      yes | sudo pacman -S clamav
      ;;
    "VeraCrypt")
      yes | sudo pacman -S veracrypt
      ;;
    "Bitwarden")
      sudo pacman --noconfirm -S fuse
      cd ~/Downloads && wget https://vault.bitwarden.com/download/?app=desktop&platform=linux&variant=appimage
      ;;
    "Keepass")
      sudo pacman --noconfirm -S keepass
      ;;
    "BleachBit")
      yes | sudo pacman -S bleachbit
      ;;
    "virt-manager")
      yes | sudo pacman -S virt-manager
      ;;
    *)
      echo "Unsupported item $CHOICE!" >&2
      exit 1
      ;;
    esac
  done
else
	exit
fi

if (whiptail --yesno "This script can perform some basic hardening.  This increases system security at the cost of some functionality and usability.  Select \"Continue\" to continue, or \"Cancel\" to quit." --yes-button "Continue" --no-button "Cancel" 10 60);
then
	continue
else
	exit
fi

if (whiptail --yesno "Would you like to disable all radios? This will most notably break WiFi and Bluetooth -- if you don't use either of these functionalities, you're unlikely to notice this change.  Select \"Disable Radios\" to continue, or \"Cancel\" to quit." --yes-button "Disable Radios" --no-button "Cancel" 15 60);
then
	sudo rfkill block all
else
	exit
fi

if (whiptail --yesno "Would you like to disable all incoming traffic?  This will most notably break SSH, self-hosting from your computer, anything that requires incoming traffic to your PC.  Select \"Continue\" to continue, or \"Cancel\" to quit." --yes-button "Continue" --no-button "Cancel" 10 60);
then
	sudo iptables -P INPUT DROP && sudo iptables -P FORWARD DROP && sudo iptables -P OUTPUT ACCEPT && sudo chown $USER /etc/iptables/iptables.conf && sudo iptables-save > /etc/iptables/iptables.rules && sudo systemctl enable iptables 

else
	exit
fi

if (whiptail --yesno "Would you like to harden your SSH config?  This is not strictly necessary if you disabled incoming network traffic in the previous step.  Select \"Continue\" to continue, or \"Cancel\" to quit." --yes-button "Continue" --no-button "Cancel" 10 60);
then
	sudo echo "
PermitRootLogin no
PermitEmptyPasswords no
Protocol 2
ClientAliveInterval 180
MaxAuthTries 3
X11Forwarding no
IgnoreRhosts yes
UseDNS yes
" >> /etc/ssh/sshd_config
else
	exit
fi

if (whiptail --yesno "Would you like to setup secure DNS?  This is a limited-logs Swiss-based DNS setup through NextDNS.  It provides ad, tracker, and parked domain blocking.  Select \"Continue\" to continue, or \"Cancel\" to quit." --yes-button "Continue" --no-button "Cancel" 10 60);
then
	sudo rm -rf /etc/systemd/resolved.conf && sudo touch /etc/systemd/resolved.conf && sudo chown $USER /etc/systemd/resolved.conf && sudo echo "
[Resolve]
DNSOverTLS=opportunistic
DNS=45.90.28.130 45.90.30.130 2a07:a8c0::b4:d585 2a07:a8c1::b4:d585
LLMNR=no
MulticastDNS=no
FallbackDNS=
" >> /etc/systemd/resolved.conf
else
	exit
fi

if (whiptail --yesno "Now that all of these changes have been made, it's recommended that you restart your computer.  Select \"Reboot\" to reboot your PC, or \"Cancel\" to quit." --yes-button "Reboot" --no-button "Cancel" 10 60);
then
	sudo reboot
else
	exit
fi
