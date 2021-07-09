# NetworkManagerOpenVpn
Script para executar o OpenVpn via linha de comando


## Configurações Iniciais

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

## Utilização do Script

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



