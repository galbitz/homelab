# Homelab

A collection of ansible playbooks to configure my homelab.

## Roles

- wormhole - Tunnel endpoint an host of some externally accessible services: syncthing, silverbullet.md, pangolin
- thin - Internal jumpbox and tunnel client
- bone - Proxmox for home assistant
- master - Proxmox for services2 and truenas
- services2 - docker to run internal services: jellyfin, beszel, nut, etc.

## Usage

In order to use the playbooks it's required to have a sysadmin user created with sudo privileges

**mise ansible:run** to execute playbook
