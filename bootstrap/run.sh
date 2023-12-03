#!/bin/bash
export ANSIBLE_FORCE_COLOR=True
export ANSIBLE_HOST_KEY_CHECKING=False

if [ -z "$1" ]; then
  echo "Error: Sepcify the host eg. 192.168.1.19"
  exit 1
fi

echo On debian use --become-method su 
ansible-playbook bootstrap.yml -u gabor --ask-pass --ask-become-pass --ssh-common-args "-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" -i "$1,"
