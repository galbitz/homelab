#!/bin/bash
# installing libguestfs-tools only required once, prior to first run
apt update -y
apt install libguestfs-tools -y

# remove existing image in case last execution did not complete successfully
rm debian-12-generic-amd64.raw
wget https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.raw
virt-customize -a debian-12-generic-amd64.raw --update
virt-customize -a debian-12-generic-amd64.raw --install qemu-guest-agent

qm destroy 9002
qm create 9002 --name "debian-12-cloudinit-template" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
qm importdisk 9002 debian-12-generic-amd64.raw local-lvm
qm set 9002 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-9002-disk-0
qm set 9002 --boot c --bootdisk scsi0
qm set 9002 --ide2 local-lvm:cloudinit
qm set 9002 --agent enabled=1
qm set 9002 --ipconfig0 ip=dhcp
qm set 9002 --ostype l26
qm template 9002
rm debian-12-generic-amd64.raw
echo "next up, clone VM, then expand the disk: qm clone 9000 999 --name test-clone-cloud-init "
