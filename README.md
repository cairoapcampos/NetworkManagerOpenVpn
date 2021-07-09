# NetworkManagerOpenVpn
Script para executar o OpenVpn via linha de comando

## Ambiente de Teste:

Sistema Operacional: GNU/Linux Xubuntu 20.04

## Etapa 1 - Configuração Básica da VPN

## 1.Mover arquivos da VPN e definir permissões

Mover a pasta que possui os arquivos `*.ovpn`, `*.p12` e `*.key` para `/etc/openvpn/client/`. Supondo que a pasta chama `minhavpn` deveria-se
fazer o seguinte:
```
cp -R minhavpn/ /etc/openvpn/client/
chown -R usuario /etc/openvpn/client/minhavpn/
chgrp -R usuario /etc/openvpn/client/minhavpn/
```

## 2.Configurar a VPN graficamente conforme o link seguinte: 

https://support.purevpn.com/how-to-setup-openvpn-on-xubuntu-19-10

## Etapa 2 - Definição de senha para execução via linha de comando

### 1.Entrar na pasta de perfis de conexão

`cd /etc/NetworkManager/system-connections/`

### 2.Editar o perfil da conexão da vpn. Exemplo:

`nano minhavpn.nmconnection`

### 3.Comentar as linhas seguintes:
```
#cert-pass-flags=1
#password-flags=1
```
### 4.Criar o bloco `vpn-secrets` e definir `password` e `cert-pass`:
```
[vpn-secrets]
password=minhasenha
cert-pass=minhasenha
```

### 5.Reiniciar o Networkmanager:

`systemctl restart network-manager`

## Etapa 3 - Utilização do Script

### 1.Clonar repositório:
`git clone https://github.com/cairoapcampos/NetworkManagerOpenVpn.git`

### 2.Entrar no diretório:
`cd NetworkManagerOpenVpn`

### 3.Editar o script `NetworkManagerOpenVpn.sh` e alterar linha do perfil de conexão da vpn:

`nano NetworkManagerOpenVpn.sh`

Alterar `minhavpn` da variavel perfil para o nome da sua conexão vpn. A extensão `*.nmconnection` não deve ser definida aqui:

`perfil=minhavpn`

### 4. Dar permisão de execução no script:

`chmod +x NetworkManagerOpenVpn.sh`

### 5.Rodar o script:

`./NetworkManagerOpenVpn.sh`

## Links Úteis:

https://qastack.com.br/ubuntu/57339/connect-disconnect-from-vpn-from-the-command-line

https://askubuntu.com/questions/444866/how-to-save-vpn-passwords-with-networkmanger-for-nmcli





