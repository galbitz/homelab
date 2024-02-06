#!/bin/bash
# installing libguestfs-tools only required once, prior to first run
apt update -y
apt install libguestfs-tools -y

# remove existing image in case last execution did not complete successfully
rm jammy-server-cloudimg-amd64.img
wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
virt-customize -a jammy-server-cloudimg-amd64.img --update
virt-customize -a jammy-server-cloudimg-amd64.img --install qemu-guest-agent

vm_id=9000

qm destroy "$vm_id"
qm create "$vm_id" --name "ubuntu-2204-cloudinit-template" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
qm importdisk "$vm_id" jammy-server-cloudimg-amd64.img local-lvm
qm set "$vm_id" --scsihw virtio-scsi-single --scsi0 local-lvm:vm-"$vm_id"-disk-0,discard=on,ssd=on,iothread=on
qm set "$vm_id" --boot c --bootdisk scsi0
qm set "$vm_id" --ide2 local-lvm:cloudinit
qm set "$vm_id" --agent enabled=1
qm set "$vm_id" --ipconfig0 ip=dhcp
qm set "$vm_id" --ostype l26
qm set "$vm_id" --machine q35

temp_file=$(mktemp)
curl -s "https://github.com/galbitz.keys" > "$temp_file"
qm set "$vm_id" --ciuser sysadmin
qm set "$vm_id" --sshkeys $temp_file
rm "$temp_file"

qm template "$vm_id"
rm jammy-server-cloudimg-amd64.img
echo "Successfully created ubuntu-2204-cloudinit-template"