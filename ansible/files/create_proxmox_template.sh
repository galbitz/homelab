#!/usr/bin/env bash
#set -ex # e doesn't work with ansible script
set -o pipefail

trap 'error_handler $? $LINENO' ERR
error_handler() {
    echo "Error: ($1) occurred on line $2"
    cleanup
    exit 1
}

cleanup() {
    rm -f "$TEMP_IMAGE"
    rm -f "$TEMP_KEYS"
    echo Cleanup completed
}

# Parameter handling
if [ $# -lt 4 ]; then
    echo "Usage: $0 storage_location vm_id url template_name"
    echo "  storage_location: Proxmox storage location (e.g.: local-lvm)"
    echo "  vm_id: VM ID for the template"
    echo "  url: URL to download the image from"
    echo "  template_name: Name of the template"
    exit 1
fi

STORAGE=$1  # Use first argument as storage, default to "local-lvm" if not provided
vm_id=$2
URL=$3
TEMPLATE_NAME=$4

TEMP_IMAGE=$(mktemp)
TEMP_KEYS=$(mktemp)

curl -s "https://github.com/galbitz.keys" > "$TEMP_KEYS"

# check if storage exists
pvesm list $STORAGE

# installing libguestfs-tools only required once, prior to first run
apt update -y
apt install libguestfs-tools -y

wget -nv -O $TEMP_IMAGE $URL
virt-customize -a $TEMP_IMAGE --update
virt-customize -a $TEMP_IMAGE --install qemu-guest-agent

qm destroy "$vm_id"
qm create "$vm_id" --name $TEMPLATE_NAME --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
qm importdisk "$vm_id" $TEMP_IMAGE $STORAGE
qm set "$vm_id" --scsihw virtio-scsi-single \
    --scsi0 $STORAGE:vm-"$vm_id"-disk-0,discard=on,ssd=on,iothread=on \
    --boot c --bootdisk scsi0 \
    --ide2 $STORAGE:cloudinit \
    --agent enabled=1 \
    --ipconfig0 ip=dhcp \
    --ostype l26 \
    --machine q35 \
    --ciuser sysadmin \
    --sshkeys $TEMP_KEYS

qm template "$vm_id"
echo "Successfully created $TEMPLATE_NAME"

cleanup
