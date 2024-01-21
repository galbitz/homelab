#!/bin/bash
# installing libguestfs-tools only required once, prior to first run
apt update -y
apt install libguestfs-tools -y

# remove existing image in case last execution did not complete successfully
rm debian-12-generic-amd64.raw
wget https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.raw
virt-customize -a debian-12-generic-amd64.raw --update
virt-customize -a debian-12-generic-amd64.raw --install qemu-guest-agent

vm_id=9002

qm destroy "$vm_id"
qm create "$vm_id" --name "debian-12-cloudinit-template" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
qm importdisk "$vm_id" debian-12-generic-amd64.raw local-lvm
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
rm debian-12-generic-amd64.raw
echo "Successfully created debian-12-cloudinit-template"
