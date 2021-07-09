#!/bin/bash

######################################################
# Script de start de VPN (NetworkManagerOpenVpn)     #
# Versão: 1.0 - 09/07/21                             #
# Autor: Cairo Ap. Campos                            #
######################################################

# Variaveis
perfil=minhavpn

clear

## Verifica se o usuário que executou o script é root
if [ "$USER" != "root" ]
then
      echo
      echo "Permissão negada! Por favor execute o script como root."
      echo
      exit
fi

## Menu de escolha de funções##
menu() {
   echo "#############################################################################"
   echo "######                       OpenVPN NetworkManager                    ######"
   echo "#############################################################################"
   echo "###  1 - Iniciar Perfil OpenVPN                                           ###"
   echo "###  2 - Finalizar Perfil OpenVPN                                         ###"
   echo "###  0 - Sair                                                             ###"
   echo "#############################################################################"
   echo
   echo -n "Escolha uma das opções acima: "
   read opmenu
   case $opmenu in
       1) startOpenVpn ;;
       2) stopOpenVpn ;;
       0) exit ;;
       *) echo " "
          echo "Opção Invalida! Retornando ao Menu..."
          sleep 3
          clear
          menu ;;
   esac
}

##########################
### Fuções principais  ###
##########################

startOpenVpn() {

clear

listaConexoes

# Conecta VPN via linha de comando
nmcli con up id $perfil
echo

# Deleta rota errada
ip route del default
echo "Rota padrão deletada!"
echo

listaConexoes

}


stopOpenVpn() {

clear

listaConexoes

# Desconecta VPN via linha de comando
nmcli con down id $perfil
echo

listaConexoes

}

###########################################
### Fuções chamadas por outras funções  ###
###########################################

listaConexoes() {

#Listar conexões
echo "Lista de Conexões:"
echo
nmcli con
echo

}

menu
