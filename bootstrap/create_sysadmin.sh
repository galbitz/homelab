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
ssh_dir="/home/$username/.ssh"
authorized_keys="$ssh_dir/authorized_keys"
sudoers_file="/etc/sudoers.d/$username"

if ! id "$username" &>/dev/null; then
    useradd -m "$username"
fi

chsh -s /bin/bash "$username"
usermod -aG adm,sudo,audio,video "$username"

echo "$username ALL=(ALL) NOPASSWD:ALL" > "$sudoers_file"
chmod 440 "$sudoers_file"

sudo -u "$username" mkdir -p "$ssh_dir"
sudo -u "$username" chmod 700 "$ssh_dir"

curl -sSL "https://github.com/galbitz.keys" | while IFS= read -r key; do
    [ -n "$key" ] || continue
    grep -qF "$key" "$authorized_keys" 2>/dev/null || echo "$key" | sudo -u "$username" tee -a "$authorized_keys" > /dev/null
done
