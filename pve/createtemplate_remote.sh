# installing libguestfs-tools only required once, prior to first run
apt update -y
apt install libguestfs-tools -y

# remove existing image in case last execution did not complete successfully
rm focal-server-cloudimg-amd64.img
wget https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img
virt-customize -a focal-server-cloudimg-amd64.img --update
virt-customize -a focal-server-cloudimg-amd64.img --install qemu-guest-agent

# add user - will be done by playbook
# virt-customize -a focal-server-cloudimg-amd64.img --run-command 'useradd gabor'
# virt-customize -a focal-server-cloudimg-amd64.img --run-command 'mkdir -p /home/gabor/.ssh'
# virt-customize -a focal-server-cloudimg-amd64.img --ssh-inject gabor:file:key.pub
# virt-customize -a focal-server-cloudimg-amd64.img --run-command 'chown -R gabor:gabor /home/gabor'
# virt-customize -a focal-server-cloudimg-amd64.img --ssh-inject root:file:key.pub
# virt-customize -a focal-server-cloudimg-amd64.img --root-password password:P@ssword
#virt-sysprep -a focal-server-cloudimg-amd64.img
qm destroy 9000
qm create 9000 --name "ubuntu-2004-cloudinit-template" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
qm importdisk 9000 focal-server-cloudimg-amd64.img local-lvm
qm set 9000 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-9000-disk-0
qm set 9000 --boot c --bootdisk scsi0
qm set 9000 --ide2 local-lvm:cloudinit
qm set 9000 --agent enabled=1
qm set 9000 --ipconfig0 ip=dhcp
qm template 9000
rm focal-server-cloudimg-amd64.img
echo "next up, clone VM, then expand the disk: qm clone 9000 999 --name test-clone-cloud-init "