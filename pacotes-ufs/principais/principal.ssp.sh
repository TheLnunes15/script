#!/bin/bash

echo "Pacotes necessarios"
pacman -S ttf-bitstream-vera ttf-dejavu ttf-freefont ttf-linux-libertine ttf-oxygen ttf-droid ttf-liberation ttf-ubuntu-font-family --needed --noconfirm
pacman -S alsa-utils alsa-tools flashplugin file-roller cdrkit lrzip p7zip unace unrar jdk8-openjdk libreoffice openssh bleachbit onboard evince gedit cvsps codeblocks eclipse gimp firefox vlc gvfs dosfstools tcl tk --needed --noconfirm
echo "Feito."

echo "Pacotes OBI"
pacman -U google-chrome-45.0.2454.101-1-x86_64.pkg.tar.xz --needed --noconfirm
pacman -S geany python gdb flac json-c libasyncns libpulse libsndfile squeak-vm scratch --needed --noconfirm
echo "Feito."
