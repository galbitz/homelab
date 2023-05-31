#!/bin/bash
export ANSIBLE_CONFIG=ansible.cfg
export ANSIBLE_FORCE_COLOR=True

source ../unencrypted_secrets.sh

ansible-galaxy install -r roles/requirements.yml --force
ansible-playbook $*
