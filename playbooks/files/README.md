## Create new vm

```
curl -sSL https://raw.githubusercontent.com/galbitz/homelab/selfhosted/playbooks/files/vm_new.sh | bash -s 101 node3 local-lvm
```

## Clone template

```
curl -sSL https://raw.githubusercontent.com/galbitz/homelab/selfhosted/playbooks/files/vm_clone.sh | bash -s 9002 101 node3 local-lvm
```
