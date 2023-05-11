#!/bin/bash
export ANSIBLE_FORCE_COLOR=True
export ANSIBLE_HOST_KEY_CHECKING=False

if [ -z "$1" ]; then
  echo "Error: Sepcify the host eg. 192.168.1.19"
  exit 1
fi

ansible-playbook -u root bootstrap.yml --ask-pass -i "$1,"
