#!/bin/bash

echo "SCRIPT INSTALACAO DE PACOTES-UFS"

echo "Instalando o XORG:"
pacman -S xorg-server xorg-xinit xorg-server-utils xorg-twm xorg-xclock xterm --needed --noconfirm
echo "Feito."

echo "Instalando o driver de video INTEL:"
pacman -S xf86-video-intel --needed --noconfirm
echo "Feito."

echo "Instalando a interface grafica XFCE:"
pacman -S xfce4 xfce4-goodies --needed --noconfirm
echo "Feito."

# Configurando o servidor da data e a hora
echo "# Please consider joining the pool:
#
#     http://www.pool.ntp.org/join.html
#
# For additional information see:
# - https://wiki.archlinux.org/index.php/Network_Time_Protocol_daemon
# - http://support.ntp.org/bin/view/Support/GettingStarted
# - the ntp.conf man page

# Associate to Arch's NTP pool
server 0.br.pool.ntp.org iburst
server 1.br.pool.ntp.org iburst
server 2.br.pool.ntp.org iburst
server 3.br.pool.ntp.org iburst

# By default, the server allows:
# - all queries from the local host
# - only time queries from remote hosts, protected by rate limiting and kod
restrict default kod limited nomodify nopeer noquery notrap
restrict 127.0.0.1
restrict ::1

# Location of drift file
driftfile /var/lib/ntp/ntp.drift" > /etc/ntp.conf

systemctl start ntpd
systemctl enable ntpd

echo "Servidor de data e hora configurado para BR:"
# Copiando configurações de GUI para todos os users
cp /root/.config /etc/skel -R
echo "Feito."

echo "Instalando o LDAP:"
cd LDAP/
sh configura_clientescravo.sh
pacman -U ldap-client-config-*.tar.xz --needed --noconfirm
cd ..
echo "Feito."

echo "Instalando o PHP e o PHP-SSH:"
cd php-ssh/
pacman -U php-ssh-*.tar.xz --needed --noconfirm
cd ..
echo "Feito."

echo "Instalando o restante do ambiente PHP:"
cd ambiente-php/
sh ambiente-php-*.tar.xz --needed --noconfirm
cd ..
echo "Ambiente PHP instalado e configurado."

echo "Instalando o Sublime-text:"
cd sublime/
pacman -U *.tar.xz --needed --noconfirm
cd ..
echo "Sublime-text instalado."

echo "Instalando os programas principais:"
cd principais/
sh principal.ssp.sh

echo "Instalando o Display Manager:"
sh temalogin.sh
echo "Feito."

echo "Criando um usuario PRODAP:"
useradd prodap
mkdir /home/prodap
echo "Configure a senha de usuario PRODAP. Em seguida, confirme-a:"
passwd prodap
chown prodap /home/prodap
chgrp prodap /home/prodap
echo "Feito."

echo "Criando um usuario para alunos do OBI:"
useradd aluno-obi
mkdir /home/aluno-obi
echo "Configure a senha de usuario OBI. Em seguida, confirme-a:"
passwd aluno-obi
chown aluno-obi /home/aluno-obi
chgrp aluno-obi /home/aluno-obi
echo "Feito."

echo "Criando um usuario para alunos e visitantes do DCOMP:"
useradd aluno
mkdir /home/aluno
echo "Configure a senha de usuario ALUNO. Em seguida, confirme-a:"
passwd aluno
chown aluno /home/aluno
chgrp aluno /home/aluno
echo "Feito."

echo "Instalando o Wireshark:"
pacman -S wireshark-cli wireshark-qt wireshark-gtk --needed --noconfirm
sh conf_wireshark.sh
cd ..
echo "Feito."

echo "Finalizado!"
