#!/bin/bash
export ANSIBLE_FORCE_COLOR=True

op run --env-file="./.env" -- ansible-playbook -u root -e "ansible_password={{ lookup('env','PASS') }}" -i hosts add_keys.yml

if [ $? -ne 0 ]; then
    echo 'must sign in first with eval $(op signin)'
fi
