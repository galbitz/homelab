#!/bin/bash
op user list
if [ $? -ne 0 ]; then
    echo 'must sign in first with eval $(op signin)'
    exit
fi
export cloudflaretoken=$(op read "op://infra/cloudflare-dns-api-token/password")
export ANSIBLE_CONFIG=ansible.cfg

ansible-galaxy install -r requirements.yml
ansible-playbook docker-server.yml
