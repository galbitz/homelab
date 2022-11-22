#!/bin/bash
op user list
if [ $? -ne 0 ]; then
    echo 'must sign in first with eval $(op signin)'
    exit
fi

export ANSIBLE_CONFIG=ansible.cfg

ansible-galaxy install -r roles/requirements.yml
ansible-playbook docker-server.yml
