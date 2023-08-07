#!/bin/bash
export ANSIBLE_CONFIG=ansible.cfg
export ANSIBLE_FORCE_COLOR=True

set -a 
source ../unencrypted_secrets.sh

ansible-galaxy install -r roles/requirements.yml --force

# no_proxy needed to cicrumvent a forking error on mac os
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH" export
export no_proxy='*'

ansible-playbook $*
