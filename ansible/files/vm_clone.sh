#!/usr/bin/env bash
set -e

if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <template-id> <vm-id> <vm-name> [volume-name]"
    exit 1
fi

template_id="$1"
vm_id="$2"
vm_name="$3"
volume_name="local-lvm"
if [ -n "$4" ]; then
    volume_name="$4"
fi

temp_file=$(mktemp)
curl -s "https://github.com/galbitz.keys" > "$temp_file"

qm clone "$template_id" "$vm_id" --name "$vm_name" --full --storage "$volume_name"
qm set "$vm_id" --scsihw=virtio-scsi-single
qm set "$vm_id" --machine q35
qm set "$vm_id"  --cpu host
qm set "$vm_id" --memory 4096
qm set "$vm_id" -scsi0 "$volume_name":vm-"$vm_id"-disk-0,size=2G,discard=on,ssd=on,iothread=on
qm disk resize "$vm_id" scsi0 +30G
qm set "$vm_id" --ciuser sysadmin
qm set "$vm_id" --sshkeys $temp_file

rm "$temp_file"

