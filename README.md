## Prerequisites
* install terraform, ansible, 1pwd cli, sshpass
* default vault name: infra
* pve vault item: proxmox-login
* proxmox version 7.2-3
* use wsl
` eval $(op signin)`

## Configure PVE server
```
 cd pve
 ./addkeys.sh
 ./createtemplate.sh
 ```

## Create docker server
```
./tfrun.sh init
./tfrun.sh apply
```
