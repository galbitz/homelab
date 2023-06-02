#!/bin/bash

export TF_VAR_HOME_IP=`curl -sS https://ifconfig.co`

source unencrypted_secrets.sh

docker run --rm \
    -v $(pwd):/tf \
    -w /tf \
    -u $(id -u):$(id -g) \
    -e TF_TOKEN_app_terraform_io=$TF_TOKEN_app_terraform_io \
    hashicorp/terraform:1.4 $*
