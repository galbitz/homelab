#!/usr/bin/env bash
set -e

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <vm-id>"
    exit 1
fi

vm_id="$1"

temp_file=$(mktemp)
curl -s "https://github.com/galbitz.keys" > "$temp_file"

qm create "$vm_id" --name node1 \
--scsihw virtio-scsi-single \
--scsi0 local-big:32,iothread=1,ssd=1,discard=on \
--ide2 none \
--cores 4 \
--net0 virtio,bridge=vmbr0 \
--machine q35 \
--cpu host \
--memory 8192 \
--agent enabled=1

rm "$temp_file"
