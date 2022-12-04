#!/bin/bash
export ANSIBLE_CONFIG=ansible.cfg

ansible-galaxy install -r roles/requirements.yml
ansible-playbook homelab.yml
