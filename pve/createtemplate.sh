#!/bin/bash
export ANSIBLE_FORCE_COLOR=True
ansible-playbook -i hosts create_template.yml --extra-vars "ansible_user=root"