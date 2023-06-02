#!/bin/sh

export TF_VAR_HOME_IP=`curl -sS https://ifconfig.co`

source unencrypted_secrets.sh
docker run -it --rm  \
    -v "$(pwd)":/tf \ 
    -e TF_TOKEN_app_terraform_io=$TF_TOKEN_app_terraform_io \ 
    hashicorp/terraform:1.4 $*
