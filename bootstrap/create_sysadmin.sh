#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with elevated privileges (sudo)."
    exit 1
fi

if [ -z "$1" ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

username="$1"

useradd -m "$username"
chsh -s /bin/bash "$username"
usermod -aG adm,sudo,audio,video "$username"

echo "$username ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/"$username"
sudo chmod 440 /etc/sudoers.d/"$username"

sudo -u "$username" mkdir -p /home/"$username"/.ssh
sudo -u "$username" chmod 700 /home/"$username"/.ssh
curl -sSL "https://github.com/galbitz.keys" | sudo -u "$username" tee -a /home/"$username"/.ssh/authorized_keys > /dev/null
