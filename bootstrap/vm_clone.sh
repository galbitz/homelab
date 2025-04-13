#!/usr/bin/env bash
set -e

if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <template-id> <vm-id> <vm-name> [volume-name]"
    exit 1
fi

template_id="$1"
vm_id="$2"
vm_name="$3"
volume_name="local-big"
if [ -n "$4" ]; then
    volume_name="$4"
fi

temp_file=$(mktemp)
curl -s "https://github.com/galbitz.keys" > "$temp_file"

qm clone "$template_id" "$vm_id" \
    --name "$vm_name" \
    --full \
    --storage "$volume_name"

qm disk resize "$vm_id" scsi0 +30G

qm set "$vm_id" \
    --memory 8192 \
    --cores 4 \
    --ciuser sysadmin \
    --sshkeys $temp_file

rm "$temp_file"
