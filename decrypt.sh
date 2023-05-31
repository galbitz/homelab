#!/bin/bash
gpg --quiet --batch --yes --decrypt --passphrase="$SECRET_PASSPHRASE" --output my_secret.json encrypted_secrets.sh
