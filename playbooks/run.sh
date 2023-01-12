#!/bin/bash
export ANSIBLE_CONFIG=ansible.cfg
export ANSIBLE_FORCE_COLOR=True

ansible-galaxy install -r roles/requirements.yml --force
ansible-playbook $*
