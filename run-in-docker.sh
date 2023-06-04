#!/bin/bash

docker run --rm \
    -v $(pwd):/ansible \
    -w /ansible/playbooks \
    -u $(id -u):$(id -g) \
    --env-file unencrypted_secrets.sh \
    galbitz/ansible:latest bash -c "ssh-import-id-gh galbitz && ./run.sh $*"
