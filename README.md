## Local requirements

### Install Ansible

```bash
sudo apt install python3-pip
echo 'PATH=$PATH:$HOME/.local/bin' >> ~/.bashrc
source ~/.bashrc
python3 -m pip install ansible ansible-lint yamllint
```

### Install terraform

https://developer.hashicorp.com/terraform/cli/install/apt#repository-configuration

### Ansible playbook requirements

- User to connect with (rsa key)
- Sudo right
- No password requirement for sudo

Note: currently connection uses root user but this will change

## Create servers on PVE

```
./tfrun.sh init
./tfrun.sh apply
```

## Log and metric collection communication

![](doc/comm.png)

## Upgrade pip package

```
pip install ansible-lint -U
```
