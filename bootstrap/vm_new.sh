#!/usr/bin/env bash
set -e

if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <vm-id> <vm-name> [volume-name]"
    exit 1
fi

vm_id="$1"
vm_name="$2"
volume_name="local-big"
if [ -n "$3" ]; then
    volume_name="$3"
fi

temp_file=$(mktemp)
curl -s "https://github.com/galbitz.keys" > "$temp_file"

qm create "$vm_id" --name "$vm_name" \
--scsihw virtio-scsi-single \
--scsi0 $volume_name:32,iothread=on,ssd=on,discard=on \
--ide2 none \
--cores 4 \
--net0 virtio,bridge=vmbr0 \
--machine q35 \
--cpu host \
--memory 8192 \
--agent enabled=1 \
--bios ovmf \
--efidisk0 $volume_name:1,efitype=4m,pre-enrolled-keys=0

rm "$temp_file"
