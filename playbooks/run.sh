#!/bin/bash
export ANSIBLE_CONFIG=ansible.cfg

ansible-galaxy install -r roles/requirements.yml --force
ansible-playbook homelab.yml
