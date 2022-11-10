#!/bin/sh
op user list
if [ $? -ne 0 ]; then
    echo 'must sign in first with eval $(op signin)'
    exit
fi

export TF_VAR_PM_USER=$(op read "op://infra/proxmox-login/username")
export TF_VAR_PM_PASS=$(op read "op://infra/proxmox-login/password")

terraform $*
