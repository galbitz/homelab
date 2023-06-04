#!/bin/bash

eval $(ssh-agent)
ssh-add

docker run --rm \
    -v $(pwd):/ansible \
    -v "$SSH_AUTH_SOCK:$SSH_AUTH_SOCK"
    -w /ansible/playbooks \
    -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
    --env-file unencrypted_secrets.sh \
    galbitz/ansible:latest bash -c "ssh-import-id-gh galbitz && ./run.sh $*"
