#!/bin/bash

export TF_VAR_HOME_IP=`curl -sS https://ifconfig.co`

source unencrypted_secrets.sh
terraform $*
