#!/bin/bash

echo "Instalando o Display Manager Dcomp-UFS, as dependências necessárias e habilitando o lightdm.service"
pacman -U lightdm-1-1.16.3-1-x86_64.pkg.tar.xz --needed --noconfirm
systemctl enable lightdm.service
pacman -U accountsservice-0.6.40-1-x86_64.pkg.tar.xz lightdm-gtk-greeter-1-2.0.1-2-x86_64.pkg.tar.xz lightdm-another-gtk-greeter-1.0.6.3-4-x86_64.pkg.tar.xz lightdm-another-gtk-greeter-themes-1.0.6.3-1-x86_64.pkg.tar.xz --needed --noconfirm
cp nuvem_2.jpg /usr/share/backgrounds/nuvem_2.jpg
cp -u lightdm.conf /etc/lightdm/lightdm.conf
cp -u lightdm-another-gtk-greeter.conf /etc/lightdm/lightdm-another-gtk-greeter.conf
cp -u styles.css /usr/share/lightdm-another-gtk-greeter/themes/default/styles.css
echo "Instalado!"

