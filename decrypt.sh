#!/bin/bash
gpg --quiet --batch --yes --decrypt --passphrase="$SECRET_PASSPHRASE" --output unencrypted_secrets.sh encrypted_secrets.sh
