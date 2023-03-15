#!/bin/sh
op user list
if [ $? -ne 0 ]; then
    echo 'must sign in first with eval $(op signin)'
    exit
fi

export TF_VAR_HOME_IP=`curl -sS https://ifconfig.co`

op run --env-file="./.env" -- terraform $*

