#!/bin/bash

gpg --symmetric --cipher-algo AES256 -o encrypted_secrets.sh unencrypted_secrets.sh 