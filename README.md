# NetworkManagerOpenVpn
Script para executar o OpenVpn via linha de comando

## Utilização do Script

### 1.Clonar repositório:
`git clone https://github.com/cairoapcampos/NetworkManagerOpenVpn.git`

### 2.Entrar no diretório:
`cd NetworkManagerOpenVpn`

### 3.Editar o script `NetworkManagerOpenVpn.sh` e alterar linha do perfil de conexão da vpn:

`nano NetworkManagerOpenVpn.sh`

### 3.1. Alterar `minhavpn` da variavel perfil para o nome da sua conexão vpn. A extensão `*.nmconnection` não deve ser definida aqui.

`perfil=minhavpn`

### 4. Dar permisão de execução no script:

`chmod +x NetworkManagerOpenVpn.sh`

### 5.Rodar o script:

`./NetworkManagerOpenVpn.sh`



