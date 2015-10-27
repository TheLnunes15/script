#!/bin/bash

# "Configurando o usuário aluno a ser capaz de usar o Wireshark"
echo "Configurando o usuário aluno a ser capaz de usar o Wireshark \n Permissão de root requerida."
gpasswd -a aluno wireshark

# Esse comando faz com que o não seja necessário reiniciar a sessão para que o sistema
# atualize o grupo Wireshark.
newgrp wireshark

echo "Pronto."