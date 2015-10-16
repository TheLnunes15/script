#!/bin/bash

echo "SCRIPT INSTALAÇÃO DE PACOTES-UFS"

echo "Instalando o XORG"
pacman -S xorg-server xorg-xinit xorg-server-utils xorg-twm xorg-xclock xterm --needed --noconfirm
echo "Feito."

echo "Instalando o driver de video INTEL"
pacman -S xf86-video-intel --needed --noconfirm
echo "Feito."

echo "Instalando a interface grafica XFCE"
pacman -S xfce4 xfce4-goodies --needed --noconfirm
echo "Feito."

echo "Instalando o LDAP"
cd LDAP/
sh configura_clientescravo.sh
pacman -U ldap-client-config-*.tar.xz --needed --noconfirm
cd ..
echo "Feito."

echo "Instalando PHP e PHP-SSH"
cd php-ssh/
pacman -U php-ssh-*.tar.xz --needed --noconfirm
cd ..
echo "Feito."

echo "Instalando o restante do ambiente PHP"
cd ambiente-php/
sh ambiente-php-*.tar.xz --needed --noconfirm
cd ..
echo "Ambiente PHP Instalado e Configurado"

echo "Instalando o Sublime-text"
cd sublime/
pacman -U *.tar.xz --needed --noconfirm
cd ..
echo "Sublime-text instalado."

echo "Instalando programas principais do Repo Oficial"
cd principais/
sh principal.ssp.sh
cd ..
echo "Feito."

echo "Instalando Display Manager"
cd Display_Manager/
sh temalogin.sh
cd ..
echo "Feito."

echo "Criando um usuario PRODAP"
useradd prodap
mkdir /home/prodap
echo "Para configurar a senha do usuario PRODAP, digite: '123456'. Em seguida, confirme-a:"
passwd prodap
chown prodap /home/prodap
chgrp prodap /home/prodap
echo "Feito."

echo "Criando um usuario para alunos do OBI"
useradd aluno-obi
mkdir /home/aluno-obi
echo "Para configurar a senha do usuario OBI, digite: 'obiufs'. Em seguida, confirme-a:"
passwd aluno-obi
chown aluno-obi /home/aluno-obi
chgrp aluno-obi /home/aluno-obi
echo "Feito."

echo "Finalizado!"
