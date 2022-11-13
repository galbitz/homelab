## Local requirements

### Install 1password cli
https://developer.1password.com/docs/cli/sign-in-manually

### Install Ansible
```bash
sudo apt install python3-pip
echo 'PATH=$PATH:$HOME/.local/bin' >> ~/.bashrc
source ~/.bashrc
python3 -m pip install --user -U ansible ansible-lint yamllint
```
### Install terraform
https://developer.hashicorp.com/terraform/cli/install/apt#repository-configuration
### Other requirements
* default vault name: infra
* pve vault item: proxmox-login
* proxmox version 7.2-3
* use wsl

## Configure PVE server
```
 cd pve
 ./addkeys.sh
 ./createtemplate.sh
 ```

## Create servers on PVE
```
./tfrun.sh init
./tfrun.sh apply
```
