#!/bin/bash

export TF_VAR_HOME_IP=`curl -sS https://ifconfig.co`

source unencrypted_secrets.sh

docker run --rm \
    -v $(pwd):/tf \
    -w /tf \
    -u $(id -u):$(id -g) \
    --env-file unencrypted_secrets.sh \
    hashicorp/terraform:1.4 $*