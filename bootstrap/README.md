git clone https://github.com/galbitz/homelab.git

## Create new vm

```
./vm_new.sh 101 node3 local-lvm
```

## Clone template

```
./vm_clone.sh 9002 101 node3 local-lvm
```

##

./create_proxmox_template.sh local-big 9404 https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img ubuntu-2404-cloudinit-template

##

./create_proxmox_template.sh local-big 9002 https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.raw debian-12-cloudinit-template
